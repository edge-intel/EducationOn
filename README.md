
# EducationOn — Toolkit for School IT Admins

> Practical, low-overhead scripts and guides to keep school computer labs and teacher devices running smoothly.

[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](#license)
[![Platform](https://img.shields.io/badge/Platform-Windows-blue.svg)](#)
[![Audience](https://img.shields.io/badge/Audience-K12%20IT%20Admins-8A2BE2.svg)](#)

**EducationOn** provides small, auditable tools for common administrative tasks in school environments—especially where students share PCs and accounts, and where you need quick wins without a full AD/Intune rollout.

---

## 📂 What’s inside

- **RedirectFolders.bat**  
  Redirects user shell folders (e.g., *Desktop*, *Documents*) to local paths per machine—useful for shared accounts and fast lab resets. Runs with elevation and prints a summary at the end.

- **WinUpdateServ.bat** (+ `readme-WinUpdateServ.txt`)  
  Helper script for handling Windows Update service behavior in lab/classroom scenarios. See the companion `readme-WinUpdateServ.txt` for usage and caveats.

- **link to QRCode.xlsx**  
  Spreadsheet template for generating QR codes (e.g., Wi-Fi join links, classroom rules, support contacts).

- **tools/**  
  Staging area for additional scripts/utilities (to be documented as they are added).

---

## 🎯 Why this exists (School context)

- **Shared PCs & rotating users** — Keep student data local/per-device to avoid profile bloat and speed up logons.  
- **Minimal infra required** — Helpful where there is no domain controller or where GPO/Intune isn’t feasible across all sites.  
- **Auditable & simple** — Plain batch scripts that can be inspected, adapted, or rewritten in PowerShell.  

---

## 🚀 Quick start

1. **Clone or download**
   ```bash
   git clone https://github.com/edge-intel/EducationOn
   ```
   Or download as ZIP from GitHub.

2. **Run as Administrator**  
   - Right-click the script (`RedirectFolders.bat` or `WinUpdateServ.bat`) → **Run as administrator**.  
   - Follow on-screen prompts.

3. **Test on a pilot PC first**  
   Validate behavior with a non-critical machine (or VM) before broad rollout.

> 💡 Tip: create a local admin-only USB with the scripts + a small change log so techs can execute consistent steps in classrooms.

---

## 🛠 Usage notes

### RedirectFolders.bat
- **What it does**: Lists users on the device, lets you choose targets, then redirects selected folders (Desktop/Documents) to local machine paths. Copies existing content and updates the registry mappings.  
- **Good for**: Shared accounts, exam stations, low-bandwidth sites, and quick “reset” workflows.  
- **Log/summary**: The script prints a success/failure summary at the end.  

### WinUpdateServ.bat
- **What it does**: Assists with Windows Update service behavior for lab PCs.  
- **Documentation**: See `readme-WinUpdateServ.txt` for exact switches, modes, and safeguards.  
- **Important**: Changes to Windows Update can have security implications—ensure compliance with your school’s patch policy.

### link to QRCode.xlsx
- **Intuitive usage just look inside the file**

---

## 🤝 Contributing

1. Fork the repo, create a feature branch, and commit small, reviewable changes.  
2. Include **before/after notes** and screenshots/log snippets where relevant.  
3. Open a PR with:  
   - Purpose of the change  
   - Test steps / rollback instructions  
   - Any policy or security implications  

---

## 🔐 Disclaimer

These scripts are provided **as-is**, without warranty of any kind.  
They make changes to user folders and/or Windows services — **always test first on non-production machines**.  
By using them, you accept full responsibility for outcomes in your environment.

---

## 📜 License

This project is licensed under the **MIT License**. See [`LICENSE`](./LICENSE).

---

## 🌐 Links

- Project site: [https://education-on.org](https://education-on.org)  
- Issues & support: use [GitHub Issues](../../issues) to report bugs or request features


## 🇵🇹 Nota final (PT)

Este repositório destina-se a equipas de TI escolares que precisam de soluções simples e auditáveis para gerir parques informáticos partilhados.  
Se tiveres sugestões ou scripts úteis, contribui com um PR ou abre um *issue*. Obrigado!


## License

MIT License

Copyright (c) 2024 Edge-Intel.com

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
**
## Disclaimer
**This script is provided as-is without any warranty. Use it at your own risk. The author is not responsible for any damage or data loss that may occur as a result of using this script.**
