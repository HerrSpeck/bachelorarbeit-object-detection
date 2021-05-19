# Object detection for images of stage plays

## Python
It is highly recommended to use conda to manage this project.  
You will require two separate environments for the object detection and image colorization.  

The object detection environment requirements can be installed using the .bachelor.txt file in the root of this repo:
`conda env create -n bachelor -f .bachelor.txt`

The image colorization environment can be installed, by running:  
`conda env create -f deoldify/environment.yml`

## Custom libraries
Git submodule for tensorflow object detection models and DeOldify image colorizer.

Activate with:
```
git submodules update --init
```

To ensure the object detection and image colorization libraries work correctly, run:  
```
# For object detection:
cd models/research/
protoc object_detection/protos/*.proto --python_out=.
cp object_detection/packages/tf2/setup.py .
python -m pip install -q .
cd ../../

# For image colorization
cd deoldify
python -m pip install -q .
cd ..
```
And then you should probably restart your shell (just to be safe).

## Usage
### Images
Images have to be in RGB colorspace, otherwise the notebook will not execute correctly.  
If you want to use the original grayscale images, use the `convert.sh` script to make sure all your images are in RGB.

### Structure
Folders:  
input/grayscale - should contain all input images (jpg format)  
input/colorized\_stable - should contain all input images (jpg format) that have been colorized using the stable deoldify model
input/colorized\_artistic - should contain all input images (jpg format) that have been colorized using the artistic deoldify model
results/ - will contain output images

### Running
Make sure to always start the jupyter notebook server inside this folder (Object Detection). Otherwise the paths could be wrong.

## Tips

### No such file or directory: 'models\tmpXXXXXX' when trying to load colorizer model
Create a folder called 'models' in this directory and download the following two pretrained weights into that folder:  
https://data.deepai.org/deoldify/ColorizeArtistic_gen.pth  
https://www.dropbox.com/s/usf7uifrctqw9rl/ColorizeStable_gen.pth?dl=1

### Font size of confidence score on resulting images
The font size of the displayed categories on detected objects can be changed:  
[Change font size](https://stackoverflow.com/questions/47242183/customizing-tf-object-detection-bounding-box-thickness-label-font-size) (last answer)

