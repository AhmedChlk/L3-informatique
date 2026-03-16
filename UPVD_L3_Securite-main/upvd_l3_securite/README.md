# Sécurité Informatique - L3 Info UPVD

Dépôt contenant les supports de cours, travaux dirigés, examens et exemples de code pour l'enseignement de la sécurité informatique en Licence 3 Informatique à l'Université de Perpignan Via Domitia.

## ⚠️ Disclaimer / Avertissement

**USAGE PÉDAGOGIQUE UNIQUEMENT**

Ce dépôt contient du matériel pédagogique destiné exclusivement à l'enseignement de la sécurité informatique dans un cadre académique. Les techniques, codes et exemples présentés sont fournis à des fins éducatives et de sensibilisation.

### Responsabilités

- **Usage autorisé** : Les contenus de ce dépôt sont réservés aux étudiants inscrits au cours de Sécurité Informatique (L3 Info UPVD) et doivent être utilisés uniquement dans le cadre des travaux pratiques supervisés.
- **Usage interdit** : Toute utilisation malveillante, illégale ou non autorisée des techniques et codes présentés est strictement interdite et engage la responsabilité pénale de l'utilisateur.
- **Cadre légal** : L'utilisation de techniques d'intrusion, d'injection de code ou d'exploitation de vulnérabilités en dehors d'un environnement contrôlé et autorisé est passible de poursuites judiciaires (Code pénal, articles 323-1 à 323-7).

### Précautions

- Les exemples de code doivent être testés **uniquement** dans des environnements isolés (machines virtuelles, conteneurs, laboratoires dédiés).
- Ne jamais déployer ou tester ces techniques sur des systèmes en production ou sans autorisation écrite explicite.
- Les connaissances acquises doivent servir à améliorer la sécurité des systèmes, pas à les compromettre.

**En utilisant ce dépôt, vous acceptez ces conditions et reconnaissez votre entière responsabilité quant à l'usage que vous ferez du contenu.**

---

## Structure du dépôt

```
upvd_l3_securite/
│
├── LICENSE                          # Licence du projet (CC BY-SA 4.0)
├── README.md                        # Ce fichier
│
├── assets/                          # Ressources partagées
│   ├── images/
│   │   └── logos/                   # Logos université, partenaires
│   └── references/                  # Documents de référence
│
├── cours/                           # Supports de cours
│   │
│   ├── 00-presentation/             # Introduction à la sécurité
│   │   ├── figures/
│   │   └── *.tex, *.pdf
│   │
│   ├── 01-logiciels-malveillants/   # Virus, trojans, malwares
│   │   ├── figures/
│   │   ├── slides-malware-fr.pdf    # Version française
│   │   ├── slides-malware-fr.tex
│   │   ├── slides-malware-en.pdf    # Version anglaise
│   │   └── slides-malware-en.tex
│   │
│   ├── 02-virus-interprete/         # Virus en langages interprétés (Bash)
│   │   ├── figures/
│   │   └── *.tex, *.pdf
│   │
│   ├── 03-debordement-tampon/       # Buffer overflow, stack overflow
│   │   ├── exemples/
│   │   ├── figures/
│   │   └── *.tex, *.pdf
│   │
│   ├── 04-injection-code/           # Injection SQL, XSS, CSRF
│   │   ├── exemples/
│   │   ├── figures/
│   │   └── *.tex, *.pdf
│   │
│   └── 05-securite-reseau/          # Sécurité réseau, pare-feu, crypto
│       ├── figures/
│       └── *.tex, *.pdf
│
├── travaux-diriges/                 # Travaux dirigés (miroir des cours)
│   │
│   ├── 01-logiciels-malveillants/   # TD du chapitre 01
│   │   ├── td01/                    # Premier TD
│   │   │   ├── sujet-fr.pdf         # Sujet en français
│   │   │   ├── sujet-fr.tex
│   │   │   ├── sujet-en.pdf         # Sujet en anglais
│   │   │   ├── sujet-en.tex
│   │   │   ├── corrige-fr.pdf       # Corrigé en français
│   │   │   ├── corrige-fr.tex
│   │   │   ├── corrige-en.pdf       # Corrigé en anglais
│   │   │   └── corrige-en.tex
│   │   └── td02/                    # Deuxième TD
│   │       └── (même structure)
│   │
│   ├── 02-virus-interprete/         # TD du chapitre 02
│   │   └── td01/
│   │       ├── sujet-fr.pdf
│   │       ├── sujet-fr.tex
│   │       ├── corriges/            # Scripts corrigés
│   │       ├── scripts/             # Scripts d'exemples
│   │       └── figures/
│   │
│   ├── 03-debordement-tampon/       # TD du chapitre 03
│   │   └── td01/
│   │       ├── sujet-fr.pdf
│   │       ├── sujet-fr.tex
│   │       ├── corrige-fr.pdf
│   │       ├── exemples/            # Codes C d'exemples
│   │       └── figures/
│   │
│   ├── 04-injection-code/           # TD du chapitre 04
│   │   └── td01/
│   │       ├── sujet-fr.pdf
│   │       ├── sujet-fr.tex
│   │       ├── corrige-fr.pdf
│   │       ├── exemples/            # Fichiers PHP, SQL, HTML
│   │       └── figures/
│   │
│   └── 05-securite-reseau/          # TD du chapitre 05
│       └── td01/
│           ├── sujet-fr.pdf
│           ├── sujet-fr.tex
│           ├── corrige-fr.pdf
│           └── figures/
│
└── examens/                         # Examens par année universitaire
    │
    ├── 2021-2022/
    │   └── 2021-2022/
    │       ├── CT1/                 # Contrôle terminal 1
    │       ├── CT2/                 # Contrôle terminal 2
    │       └── Fichiers-clefs-usb/
    │
    ├── 2022-2023/
    │   └── 2022-2023/
    │       ├── CC1/                 # Contrôle continu 1
    │       └── CC2/                 # Contrôle continu 2
    │
    ├── 2023-2024/
    │   └── 2023-2024/
    │       ├── CC1/
    │       └── CC2/
    │
    └── 2024-2025/
        └── 2024-2025/
            └── CT/                  # Contrôle terminal
```

---

## Description des chapitres

### Cours

| Chapitre | Titre | Description |
|----------|-------|-------------|
| 00 | Présentation | Introduction générale à la sécurité informatique, enjeux et menaces |
| 01 | Logiciels malveillants | Typologie des malwares (virus, trojans, vers, ransomwares) |
| 02 | Virus interprétés | Virus en langages interprétés, focus sur Bash |
| 03 | Débordement de tampon | Buffer overflow, stack overflow, exploitation mémoire |
| 04 | Injection de code | Injection SQL, XSS, CSRF, sécurisation des applications web |
| 05 | Sécurité réseau | Attaques réseau, pare-feu, NAT, cryptographie, VPN |

### Travaux Dirigés

Les travaux dirigés sont organisés en **miroir de la structure des cours**, avec un dossier par chapitre contenant un ou plusieurs sous-dossiers `td01/`, `td02/`, etc.

| Chapitre | Nombre de TD | Contenu |
|----------|--------------|---------|
| 01-logiciels-malveillants | 2 TD | Analyse de malwares, comportement viral |
| 02-virus-interprete | 1 TD | Scripts Bash, propagation virale |
| 03-debordement-tampon | 1 TD | Exploitation mémoire, codes C vulnérables |
| 04-injection-code | 1 TD | SQL injection, XSS, fichiers PHP/HTML |
| 05-securite-reseau | 1 TD | Attaques réseau, configurations sécurisées |

Chaque TD contient :
- **Sujets** : `sujet-fr.pdf` (français), `sujet-en.pdf` (anglais)
- **Corrigés** : `corrige-fr.pdf` (français), `corrige-en.pdf` (anglais)
- **Ressources** : `exemples/`, `scripts/`, `figures/` selon le TD

### Examens

Examens organisés par année universitaire (2021 à 2025), incluant sujets, corrigés et fichiers de test.

---

## Compilation LaTeX

Les supports de cours et TD sont au format LaTeX (Beamer pour les slides).

### Prérequis
```bash
# Debian/Ubuntu
sudo apt install texlive-full texlive-lang-french

# Fedora/RHEL
sudo dnf install texlive-scheme-full
```

### Compilation des cours
```bash
cd cours/01-logiciels-malveillants/
pdflatex slides-malware-fr.tex
pdflatex slides-malware-fr.tex  # Seconde passe pour références
```

### Compilation des TD
```bash
cd travaux-diriges/01-logiciels-malveillants/td01/
pdflatex sujet-fr.tex
pdflatex sujet-fr.tex  # Seconde passe pour références
```

---

## Conventions de nommage

### Cours

| Type | Format | Exemple |
|------|--------|---------|
| Slides français | `slides-{sujet}-fr.pdf` | `slides-malware-fr.pdf` |
| Slides anglais | `slides-{sujet}-en.pdf` | `slides-malware-en.pdf` |

### Travaux Dirigés

| Type | Format | Exemple |
|------|--------|---------|
| Sujet français | `sujet-fr.pdf` | `td01/sujet-fr.pdf` |
| Sujet anglais | `sujet-en.pdf` | `td01/sujet-en.pdf` |
| Corrigé français | `corrige-fr.pdf` | `td01/corrige-fr.pdf` |
| Corrigé anglais | `corrige-en.pdf` | `td01/corrige-en.pdf` |

### Règles générales

- **Suffixe de langue** : `-fr` pour français, `-en` pour anglais
- **Figures** : Stockées dans les sous-dossiers `figures/`
- **Noms de fichiers** : Format kebab-case (minuscules, tirets)
- **Encodage** : UTF-8 pour tous les fichiers

---

## Contribution

Ce dépôt est maintenu par l'équipe pédagogique. Les étudiants peuvent signaler des erreurs via issues ou proposer des améliorations via pull requests.

---

## Licence

Ce projet est sous licence [Creative Commons Attribution-ShareAlike 4.0 International (CC BY-SA 4.0)](LICENSE).

Vous êtes libre de :
- **Partager** : copier et redistribuer le matériel
- **Adapter** : remixer, transformer et créer à partir du matériel

Sous les conditions suivantes :
- **Attribution** : Vous devez créditer l'auteur original
- **Partage dans les mêmes conditions** : Vos contributions doivent être sous la même licence

---

## Auteur

**Cédric Legrand**
Enseignant-chercheur
Université de Perpignan Via Domitia (UPVD)
Département Informatique

---

## Ressources complémentaires

- [ANSSI](https://www.ssi.gouv.fr/) - Agence nationale de la sécurité des systèmes d'information
- [OWASP](https://owasp.org/) - Open Web Application Security Project
- [CERT-FR](https://www.cert.ssi.gouv.fr/) - Centre gouvernemental de veille, d'alerte et de réponse

---

*Dernière mise à jour : 2026-02*
