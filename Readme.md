# All-sky imager observation data from the Chinese Yellow River Station, Ny-Ålesund, Svalbard

Expanded from https://zenodo.org/records/10464846

The actual processing code was based on https://github.com/orobix/retina-unet

Author: Wang, Qian1

## Introduction

The aurora images in this dataset are from the all-sky imagers at the Yellow River Station (YRS). And it is used in the paper Automatically sketching Auroral Skeleton Structure in All-sky Image for Measuring Aurora Arcs.

This dataset consists of the following sections:

N20040116G.zip: 4,319 observation images as of January 16, 2004;
Raw data and reading code.zip: 8634 raw data items of December 23, 2003, and reading code;
80 imgs&annotations.zip: 80 ASI images and the corresponding manual annotations with pixel-level masks.
In the following sections, the data source, acquisition instruments, data characteristics, preprocessing methods and naming conventions of this dataset will be introduced.

## Data source

The auroral images used in this study are ground-based observation data acquired by three-wavelength (427.8, 557.7, and 630.0 nm) all-sky imagers at YRS in Ny-Ålesund, Svalbard. The geographic coordinates of YRS are 78.92°N, 11.93°E, and the corrected geomagnetic latitude is 76.24°, MLT≈UT+3 h.

## Data acquisition instruments

Data were obtained from all-sky CCD auroral imagers. The system can record 24-hour auroral activities from October to March of the following winter each year.

## Data characteristics

The time resolution of the observation results of two consecutive frames is 10 s. The camera uses a 512×512 square pixel array, and the geographic zenith is located near the center of the field of view (FOV). The coverage diameter of the all-sky FOV is approximately 1000 km. The spatial resolution is from 1.1 km at the zenith to 36 km at the horizon at an altitude of 150 km. All aurora images are provided in .bmp image format.

## Data preprocess

Subtracting dark current and rescaling. Dark current is deemed as system noise caused by equipment. It is removed from images before further operation. Every image is then stretched with a cutoff value of 4000 and rescaled from 16 to 8 bits.
Masking and cropping. A circle mask with a radius of 220 pixels is applied to cut off the outer regions where significant wide-angle distortion happens and may contain YRS lights. Then, the original image size of 512×512 is cropped to 440×440 pixels.
 Rotation. We rotated the images counter-clockwise by 61.11 with the north being upward.
Data naming convention:

Each auroral data has a unique file name that contains the N/S, date, band, and time information.

Filename example: N20031221G081212.

N: North pole
20031221: December 21, 2003
G: G-band
081212: 8:12:12 UT
