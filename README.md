# EducationOn — Toolkit for School IT Admins

Practical, low-overhead scripts and guides to keep school computer labs and teacher devices running smoothly.

EducationOn provides small, auditable tools for common administrative tasks in school environments—especially where students share PCs and accounts, and where you need quick wins without a full AD/Intune rollout.

License: MIT | Platform: Windows | Audience: K12 IT Admins

## What's inside

```
scripts/
  folder-redirect/
    RedirectFolders.bat        Redirect Desktop/Documents to local per-machine paths
  local-user-provisioning/
    CreateLocalUsers.ps1       Create local Windows accounts from a user:pass list
    userlist.example.txt       Example input file, copy it, fill it in, never commit it

templates/
  QRCode-template.xlsx         Pull-and-use spreadsheet for generating QR codes
```

**scripts/folder-redirect/RedirectFolders.bat**
Redirects user shell folders (e.g., Desktop, Documents) to local paths per machine—useful for shared accounts and fast lab resets. Runs with elevation and prints a summary at the end.

**scripts/local-user-provisioning/CreateLocalUsers.ps1**
Interactive PowerShell script that creates local Windows accounts (Home editions or machines without AD) from a username:password list, with an option to promote selected accounts to Administrator. Prints a run summary at the end.

**templates/QRCode-template.xlsx**
Spreadsheet template for generating QR codes (e.g., Wi-Fi join links, classroom rules, support contacts). Just download and open, usage is inside the file.

New tools should be added as their own folder under scripts/, with a short usage note either inline in this README or as a README.md alongside the script.

## Why this exists (School context)

Shared PCs and rotating users make it worth keeping student data local/per-device to avoid profile bloat and speed up logons. Most sites here run with minimal infra, so these tools help where there is no domain controller or where GPO/Intune isn't feasible everywhere. Everything is kept auditable and simple: plain batch/PowerShell scripts that can be inspected, adapted, or rewritten by any tech on the team.

## Quick start

Clone or download the repository:

git clone https://github.com/edge-intel/EducationOn

Or download as ZIP from GitHub.

Then run the script as Administrator. Right-click the script you need (e.g. scripts/folder-redirect/RedirectFolders.bat) and choose "Run as administrator". For the PowerShell script, open an elevated PowerShell prompt and run:

Set-ExecutionPolicy RemoteSigned -Scope Process -Force
.\scripts\local-user-provisioning\CreateLocalUsers.ps1

Follow the on-screen prompts, and test on a pilot PC or VM first before rolling out broadly.

Tip: create a local admin-only USB with the scripts plus a small change log so techs can execute consistent steps in classrooms.

## Usage notes

### RedirectFolders.bat
What it does: lists users on the device, lets you choose targets, then redirects selected folders (Desktop/Documents) to local machine paths. Copies existing content and updates the registry mappings.
Good for: shared accounts, exam stations, low-bandwidth sites, and quick "reset" workflows.
Log/summary: the script prints a success/failure summary at the end.

### CreateLocalUsers.ps1
What it does: reads a username:password list (see userlist.example.txt), creates each account as a standard user, and optionally promotes selected accounts to Administrator. Prints a run summary (created / skipped / errors / promoted).
Good for: quickly provisioning classroom or lab machines that aren't domain-joined.
Security note: the input file holds plaintext passwords. Copy userlist.example.txt to userlist.txt (already git-ignored), fill it in locally, run the script, then delete userlist.txt. Never commit real credentials.

### templates/QRCode-template.xlsx
Intuitive usage, just download and look inside the file.

## Contributing

Fork the repo, create a feature branch, and commit small, reviewable changes. Include before/after notes and screenshots or log snippets where relevant. When opening a PR, describe the purpose of the change, the test steps or rollback instructions, and any policy or security implications.

See CONTRIBUTING.md for more detail.

## Disclaimer

These scripts are provided as-is, without warranty of any kind. They make changes to user folders, Windows services, and/or local accounts, so always test first on non-production machines. By using them, you accept full responsibility for outcomes in your environment.

## License

This project is licensed under the MIT License. See LICENSE.

## Links

Issues and support: use GitHub Issues to report bugs or request features

## Nota final (PT)

Este repositório destina-se a equipas de TI escolares que precisam de soluções simples e auditáveis para gerir parques informáticos partilhados.
Se tiveres sugestões ou scripts úteis, contribui com um PR ou abre um issue. Obrigado!
