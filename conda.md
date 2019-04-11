```bash
conda create -n XXname python=2.7
conda env export > environment.yml
conda create --name myclone --clone myenv
conda activate XXname
conda deactivate
conda list  
conda remove --name myenv --all
conda info --envs
```
