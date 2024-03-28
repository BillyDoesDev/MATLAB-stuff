# MATLAB Open Ended Experiments
This is a record of the stuff I did for my open ended experiments for my vocational elective in college.

## Open Ended Experiment - I
**Noise filtering from a noisy signal/audio using the Fast Fourier Transform (FFT) algorithm.**


**AIm:** Noise filtering from a noisy signal/audio using the Fast Fourier Transform (FFT) algorithm.

**Software Used:** GNU Octave 8.4.0 (Should be compatible with MATLAB 19.*)

**Theory:**

A Fast Fourier Transform (FFT) is an algorithm that computes the Discrete Fourier Transform (DFT) of a sequence, or its inverse (IDFT). Fourier analysis converts a signal from its original domain (often time or space) to a representation in the frequency domain and vice versa. The DFT is obtained by decomposing a sequence of values into components of different frequencies.

The Fourier Transform is given by:

$${\widehat {f}}(\xi )=\int _{-\infty }^{\infty }f(x)\ e^{-i2\pi \xi x}\,dx.$$

The corresponding Inverse Fourier Transform is given by:

$$f(x)=\int _{-\infty }^{\infty }{\widehat {f}}(\xi )\ e^{i2\pi \xi x}\,d\xi ,\quad \forall \ x\in \mathbb {R}$$
This operation is useful in many fields, but computing it directly from the definition is often too slow to be practical. An FFT rapidly computes such transformations by factorizing the DFT matrix into a product of sparse (mostly zero) factors. Fast Fourier transforms are widely used for applications in engineering, music, science, and mathematics. In this experiment, we take a look at how FFT is used in audio signal processing to remove noise from a noisy signal.

First, we take a noisy audio signal as input. It is the sum of two sine waves of frequency 500 Hz and 1200 Hz, to which some random white noise has been added. It is possible to compute the fast Fourier transform of this noisy signal using the fft command. The power spectral density (PSD) is the normalized squared magnitude of f, and indicates how much power the signal contains in each frequency. Following this, it is possible to zero out components that have power below a certain threshold to remove noise from the signal. After inverse transforming the filtered signal, we can retrieve the original clean signal pretty accurately.


**File structure:**
```
.
├── dirty.wav
└── remove_noise.m
1 directory, 2 files
```
**Spectrogram of dirty.wav:**



**Outputs:**


**Spectrogram of clean.wav:**



> One may play both the audio files to hear the difference between the dirty and the clean data. However, it is advisable to use headphones at a low volume for a safe, clear experience.

**Conclusion:**

In this experiment, it is seen how revolutionary the Fast Fourier Transform (FFT) algorithm really is, and how just in a couple of basic steps, we can use it to perform a vast number of everyday tasks that otherwise goes overlooked.

Here, a relatively simple audio sample was de-noised. In practical scenarios, a similar filtering may be done, perhaps with a lot more other frequencies involved in order to achieve the same goal.


**References:**

- https://en.wikipedia.org/wiki/Fast_Fourier_transform
- Data-Driven Science and Engineering: Machine Learning, Dynamical Systems, and Control, by Steven L. Brunton, J. Nathan Kutz, Cambridge University Press, 2019



## Open Ended Experiment - II

**Perform basic edge detection on an image, using the Sobel operator.**


**Aim:** Perform basic edge detection on an image, using the Sobel operator.

**Software Used:** GNU Octave 8.4.0 (Should be compatible with MATLAB 19.*)

**Theory:**

Edge detection includes a variety of mathematical methods that aim at identifying edges, defined as curves in a digital image at which the image brightness changes sharply or, more formally, has discontinuities. The same problem of finding discontinuities in one-dimensional signals is known as step detection and the problem of finding signal discontinuities over time is known as change detection. Edge detection is a fundamental tool in image processing, machine vision and computer vision, particularly in the areas of feature detection and feature extraction.

In this experiment, we take a look at the Sobel filter for edge detection. In the simplest terms, the algorithm works by running a 3x3 matrix (known as the kernel) over all the pixels in the image (which must be in grayscale). At every iteration, we measure the change in the gradient of the pixels that fall within this 3x3 kernel. The greater the change in pixel intensity, the more significant the edge there is.

The operator uses two 3×3 kernels which are convolved with the original image to calculate approximations of the derivatives – one for horizontal changes, and one for vertical. If we define A as the source image, and Gx and Gy are two images which at each point contain the horizontal and vertical derivative approximations respectively, the computations are as follows:

$${G} _{x}={
    \begin{bmatrix}
    +1 & 0 & -1\\
    +2 & 0 & -2\\
    +1 & 0 & -1
    \end{bmatrix}
}* {A}$$

$${G} _{x}={
    \begin{bmatrix}
    +1 & +2 & +1\\
     0 &  0 &  0\\
    -1 & -2 & -1
    \end{bmatrix}
}* {A}$$

where $*$ denotes the 2-dimensional signal processing convolution operation.

We can iterate through all pixels in the original image and apply the image convolution kernels Gx and Gy at every step of the way. This convolution operation will return a single integer for each kernel.

Here’s an example of what applying the Gx kernel on a specific pixel (in red) would look like:



On the left is the original image with the 3x3 pixel group colored.

The penultimate step is to create a new image of the same dimensions as the original image and store for the pixel data, the magnitude of the two gradient values. 

Now, we should have a new grayscale image whose pixel intensities reflect how close they are to an edge in the original image. Naturally, the higher the gradient value for the pixel, the brighter the edge in the resultant image will appear.


**Directory structure:**
```
edge_detection
├── detect_edges.m
└── engine_part.png

1 directory, 2 files
```


**Output:**




**Conclusion:**

In this experiment, it is seen how by some simple convolution, using the Sobel filter, we are able to perform some pretty accurate edge detection on any given image. Edge detection finds its use cases in a multitude of day-to-day applications, computer vision, and even medicine for cancer cell detection, etc.

The Sobel filter is a simple, yet powerful idea that forms the basis of some of the more complex edge detection techniques used today.


**References:**

- https://en.wikipedia.org/wiki/Kernel_(image_processing)#Convolution
- https://en.wikipedia.org/wiki/Sobel_operator
- https://aryamansharda.medium.com/how-image-edge-detection-works-b759baac01e2


