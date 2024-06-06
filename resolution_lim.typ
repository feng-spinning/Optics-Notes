#set text(12pt, font: ("Times New Roman", "SimSun"))
#set rect(width: 100%, height: auto, inset: 4pt, fill: rgb("#eeffee"))
#let indent = h(1em)
#set math.mat(delim: "[")
#show figure.where(
kind: table
): set figure.caption(position: top)


#let indent = h(1em)
#let ali = h(1.2em)
#let pp = v(0.5em)
#let today = datetime.today()
#align(center, text(17pt)[*Discussion of the Diffraction Limit*])
#align(center, text(15pt)[#today.display() Zijia Feng])

#import "@preview/sourcerer:0.2.1": code
#import "@preview/physica:0.9.1": *
#import "@preview/i-figured:0.2.3"
#import "@preview/ctheorems:1.1.0": *
#show: thmrules

#let theorem = thmbox("theorem", "Theorem", fill: rgb("#eeffee"))
// make sure you have some heading numbering set
#set heading(numbering: "1.1.")

// // apply the show rules (these can be customized)
// #show heading: i-figured.reset-counters
// #show math.equation: i-figured.show-equation.with(
//   level: 1,
//   zero-fill: true,
//   leading-zero: true,
//   numbering: "(1.1)",
//   prefix: "eqt:",
//   only-labeled: false,  // numbering all block equations implicitly
//   unnumbered-label: "-",
// )

#set math.equation(numbering: "(1.1)")

= Introduction to my question
#pp
When we discuss the simplist case of imaging system: A lens with a circular pupil of diameter $w$, the angular and line diffraction limit is always given by:

$
delta theta = 1.22 (lambda ) / (w) \
delta x = 1.22 (lambda z_i) / (w)
$<11>

*I wonder: if a lens with an infinitly large pupil is used, i.e. $w -> infinity$, will $delta x -> 0$?*

= Derivation of the above formula

#pp
The above formula @11 can be easily accessed by a conclusion from Fourier Optics @Goodman146

#theorem[For a diffraction-limited system, the impulse response of the imaging system is the Fourier Transform of the pupil function]

So for a circular pupil, its FT is the $J_1$, an Airy disk, with first zero point at $1.22 lambda / w$.



*But the derivation of this conclusion uses the Fresnel diffraction formula rather than the accurate angular spectrum.* The transmmission function used in the derivation is 
$
H(f_x,f_y) = exp(j k z)exp[-j pi lambda z (f_x ^2 + f_y ^2)]
$

which is a first-order approximation of the angular spectrum method, whose formula should be

$
H(f_x,f_y) = exp(j k z sqrt(1- (lambda f_x)^2 - (lambda f_y)^2))
$<asm>

This approximation usually holds *ONLY for* $bold(abs(lambda f_x)), bold(abs(lambda f_y) << 1)$, which is small angle approximation. The exact applicable could be derived from the Taylor expansion of the sqrt function. Suppose $theta$ is the $arrow(k)$'s angle with the $z$ axis. The Fresnel formula holds when:

$
(theta ^4 z) / (4 lambda) << 1
$


If we want $w -> infinity$, of course the $theta$ will be larger than the above criterion, so the @11 is no longer valid. We *CANNOT* make $w -> infinity$ and claim the diffraction limit is broken.

= Diffraction Limit in the general case
#pp
Next question is: If the above @11 only holds for paraxial approximation, what formula should we use to describe the diffraction limit in the general case?

The diffraction limit can be rewritten as $
delta x = 1.22 lambda / (2"NA") = lambda / (2 n sin alpha) >= lambda / (2n)
$<22>

But @22 seems contradict with @11, as @11 indicates a $tan$ relationship, rather than $sin$. This can be explained by the *Abbe sine condition*.

#theorem[the sine of the object-space angle $alpha_o$
should be proportional to the sine of the image space angle $alpha_i$.
]

#figure(
  image("abbysin.png", width: 80%),
  caption: [Abbe sine condition from Wikipedia]
)

A collary of the Abbe sine condition @Mertz2019  establishes a linear correspondence between transverse wavevector components in the object (or image) plane, and spatial coordinates in the pupil plane.

#figure(
  image("sincol.png", width: 70%),
  caption: [linear correspondence]
)



= Numerical Aperture
#pp
As Rudolf Kingslake explains, "It is a common *error *to suppose that the ratio [D/2f] is actually equal to tan θ, and not sin θ ... The tangent would, of course, be correct if the principal planes were really plane. However, the complete theory of the Abbe sine condition shows that if a lens is corrected for coma and spherical aberration, as all good photographic objectives must be, the second principal plane becomes a portion of a sphere of radius f centered about the focal point"

WHYYYY? Why not tan? Why sin?

= Physics underlying the diffraction limit

== From Fourier Optics's point of view
#pp
According to the idea of angular spectrum method of @asm, only the low frequency components ($f_x^2+f_y^2 < 1"/"lambda^2$) can propagate in space, so high frequency components are lost. From this point of view, imaging cannot be perfect, as long as there is propagation in free space.

*Calculation*: The maximum frequency that can propagate is on order of $f_x = 1 / lambda$, so the diffraction limit is with the same order of $1"/"f_x = lambda$.

== From Heisenberg Uncertainty Principle's point of view

#pp
With the Heisenberg Uncertainty Principle:
$ Delta x Delta p_x > h $<unc>
(right hand side of @unc should be $hbar / 2$. $h$ is adopted here for magnitude estimation)


The photon has a momentum $ p = (h nu) / c $

Which is equivalent to $ p = h / lambda = hbar k $

$
Delta x Delta k_x > pi
$


$
Delta k_x  = 2k sin alpha <= 2k = (2 pi) / lambda
$

The equal sign is reached when the lens pupil reaches infinity.

#figure(
  image("resolu1.png")
)

($alpha -> 90$, $sin alpha -> 1$)

$
Delta x > pi / (Delta k_x) = lambda / 2
$


= Super-Resolution
#pp

The Heisenberg Uncertainty Principle offers a great physical insight into the diffraction limit. With the same point of view, we can explore ways of breaking the diffraction limit.

*The key seems counter intuitive: should $sin alpha <= 1$ hold for all scenarios?*

NO! By having a complex $k_z = j |k_z|$, have 
$
k_x ^2 = k^2-k_z^2= k^2 + |k_z|^2> k^2
$

As the uncertainty principle requires:$Delta x > pi / (Delta k_x)$, if we use *evanescent waves*: $k_x -> infinity <--> Delta x ->0$


= 高速探测
#pp
用来探测光场的探测器，响应速度比光场的频率大很多

外差干涉技术-》相位分辨

#bibliography("works.bib")