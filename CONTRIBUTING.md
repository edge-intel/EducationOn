# Contributing to EducationOn

Thanks for helping improve these tools for school IT teams. This project favors small, auditable, reviewable changes over large rewrites.

## Before you start

Fork the repo and create a feature branch off main. Keep each PR focused on one tool or one fix, since these scripts get run with elevated privileges on real school machines and small diffs are much easier to review safely.

## Adding a new tool

Give it its own folder under scripts/ (e.g. scripts/my-new-tool/). Add a short usage note either as a section in the main README.md or as a README.md inside the tool's own folder. If the tool touches user accounts, passwords, or system services, call that out explicitly, and add any example/placeholder input files rather than real credentials. If your tool needs entries in .gitignore (e.g. a local input or log file), add them there too.

## Submitting a pull request

Describe the purpose of the change, list the test steps you followed (ideally on a pilot machine or VM, not production), and note any rollback instructions. Flag any security or school-policy implications, especially for anything touching Windows Update, local accounts, or shared-folder redirection.

## Reporting issues

Use GitHub Issues for bugs or feature requests. Include the script name, Windows version, and the exact error or unexpected behavior you saw.
