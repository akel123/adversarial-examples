Code to reproduce results in the paper [Defending against Adversarial Images using Basis Functions Transformations](https://arxiv.org/pdf/1803.10840.pdf)


# Requirements

- Python 3.4 or higher
- TensorFlow 1.2.1
- Cleverhans 2.0
- sklearn
- matlab.engine

Instead of downloading the above requirments manually, you can install as done below and guarantee you have the correct versions of everything.

# Create env

Download [conda](https://docs.anaconda.com/anaconda/install/) if you haven't already and pop a terminal (mac/linux) or Anaconda Prompt (windows). Put yourself in the base folder of the repository and type
```
conda env create -f environment.yml
conda activate adversarial-defenses
```
Now to set up the matlab engine, while working in the environment you just made, type (replacing `$matlabroot` appropriatly)
```
cd $matlabroot/extern/engines/python
python setup.py install
```
where `$matlabroot` is your matlab root directory. For example, it could be similar to `/Applications/MATLAB2020_b.app`


# Usage

We use Cleverhans to perform Fast Gradient Attack. 

## Gray-box attack 

Set self.setting = 'graybox' and run:

```
python run_all.py
```

You can modify which defense/attack methods to use by changing self.defense_list and self.attack_list in config.py.


## Black-box attack 

Set self.setting = 'blackbox' and run:

```
python run_all.py
```


## White-box attack

Set self.setting = 'whitebox'

### Backward Pass Differentiable Approximation (BPDA)

```
python src/run_all_bpda.py
```

### Filtered Gradient Attack

Set self.attack_list = ['FGA'] and run:

```
python src/run_all_fga.py
```


