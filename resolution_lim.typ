#set text(12pt, font: ("Times New Roman", "SimSun"))
#set rect(width: 100%, height: auto, inset: 4pt, fill: luma(240))
#let indent = h(1em)
#set math.mat(delim: "[")
#show figure.where(
kind: table
): set figure.caption(position: top)


#let indent = h(1em)
#let ali = h(1.2em)
#let pp = v(0.5em)
#let today = datetime.today()
#align(center, text(17pt)[*Derivation of the Resolution Limit*])
#align(center, text(15pt)[#today.display()])

#import "@preview/sourcerer:0.2.1": code
#import "@preview/physica:0.9.1": *


= From Heisenberg Uncertainty Principle

#pp
(just a rough estimation, on magnitude)
$ Delta x Delta p_x > h $

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




带入光场的p，最大的

推导到x 跟k_x的关系

k_x最大是k，这个就是衍射极限了

即使透镜无限大也成立

= Super-Resolution

Use evanescent waves: $k_x -> infinity <--> Delta x ->0$

If we make $k_x$ large enough, larger than $k$, the resolution limit can be broken.

= 高速探测
#pp
用来探测光场的探测器，响应速度比光场的频率大很多

外差干涉技术-》相位分辨