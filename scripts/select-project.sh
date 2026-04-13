#!/usr/bin/env bash
# Exit immediately if any command fails, so we don't silently run with bad state.
set -e

# Run from the repo root regardless of where the user invoked the script from.
cd "$(dirname "$0")/.."

# Collect every .yaml/.yml file under projects/ into the `configs` array.
# We use a while-read loop (instead of `mapfile`) because macOS ships bash 3.2,
# which doesn't support mapfile.
configs=()
while IFS= read -r line; do
  configs+=("$line")
done < <(find projects -type f \( -name '*.yaml' -o -name '*.yml' \) | sort)

# Bail out early if there's nothing to run — nicer than an empty menu.
if [ ${#configs[@]} -eq 0 ]; then
  echo "No promptfoo configs found under projects/"
  exit 1
fi

# Build a parallel `labels` array with prettier display names:
#   projects/project-1/runningAdviceTest.yaml  →  project-1 —— runningAdviceTest
# The real path stays in `configs` so we can still pass it to promptfoo.
labels=()
for c in "${configs[@]}"; do
  label="${c#projects/}"       # strip leading "projects/"
  label="${label%.yaml}"       # strip .yaml extension
  label="${label%.yml}"        # strip .yml extension
  label="${label//\// —— }"    # replace "/" with " —— " for visual spacing
  labels+=("$label")
done

# Render an interactive numbered menu. `select` is a bash builtin that loops
# until the user picks a valid option (or Ctrl+C's out).
echo "Select a promptfoo config to run:"
PS3=$'\n> '
select label in "${labels[@]}"; do
  if [ -n "$label" ]; then
    # REPLY holds the number the user typed; convert to a 0-based index
    # to look up the original path in `configs`.
    choice="${configs[$((REPLY - 1))]}"
    echo "Running: $choice"
    # `exec` replaces this shell with promptfoo so Ctrl+C goes straight to it.
    exec pnpm exec promptfoo eval -c "$choice"
  else
    echo "Invalid selection"
  fi
done
