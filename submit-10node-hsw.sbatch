#!/usr/bin/env bash
#SBATCH -J io500-10hsw-dw
#SBATCH -N 10
#SBATCH -n 160
#SBATCH --qos regular
#SBATCH -C haswell
#SBATCH -t 2:30:00
#SBATCH -A nstaff
#SBATCH --mail-type=end,fail
#SBATCH --mail-user=glock@lbl.gov
#DW jobdw type=scratch access_mode=striped capacity=50TiB

CONFIG_FILE="$SLURM_SUBMIT_DIR/config-$SLURM_JOBID.ini"

cat <<EOF > "$CONFIG_FILE"
[global]
datadir = $DW_JOB_STRIPED

[ior-easy]
transferSize = 8m
EOF

echo "Submitting with $CONFIG_FILE:"
cat "$CONFIG_FILE"

srun "$SLURM_SUBMIT_DIR/io500" "$CONFIG_FILE"
