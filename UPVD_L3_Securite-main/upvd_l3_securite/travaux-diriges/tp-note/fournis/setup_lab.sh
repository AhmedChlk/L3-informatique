#!/bin/bash
# CryptoShell — Mise en place de l'environnement de test
# Usage: bash setup_lab.sh

mkdir -p lab/{documents,projets,archives}

echo "Rapport financier Q4 2025 - Confidentiel" > lab/documents/rapport.txt
echo "Notes de réunion du 15 janvier" > lab/documents/notes.txt
echo "Données clients - NE PAS SUPPRIMER" > lab/documents/clients.dat

echo '#!/bin/bash
echo "Script de backup"' > lab/projets/backup.sh
echo "Plan de développement 2026" > lab/projets/roadmap.txt

echo "Archive de logs serveur" > lab/archives/logs.dat
echo "Historique des transactions" > lab/archives/transactions.dat

chmod +x lab/projets/backup.sh

echo "[OK] Environnement de test créé dans ./lab/"
echo "Fichiers: $(find lab -type f | wc -l)"
