```bash
conda create -n XXname python=2.7
conda env export > environment.yml
conda env create -f environment.yml
conda create --name myclone --clone myenv
conda activate XXname
conda deactivate
conda list  
conda remove --name myenv --all
conda info --envs
conda -V
```

```bash
pip install -r requirements.txt
```

```python
# convert condalist to conda yml file
import pandas as pd
df = pd.read_table('environment.txt', '\\s+', skiprows=3, header=None, 
                   names=['Name', Version', 'Build', 'Channel'])
env = df.Name + '=' + df.Version
env.to_csv('environment.yml', header=False, index=False)
```

