# Sass parallax example
 _A Pen created at CodePen.io. Original URL: [https://codepen.io/Crimea/pen/MWYzVwO](https://codepen.io/Crimea/pen/MWYzVwO).

 By locking the perspective on the body element and transforming elements in 3D on top of that, you can easily create parallax scrolling effects that don’t require JavaScript and can be much more performant as a result. [Mixins can be found here](https://github.com/Team-Sass/toolkit/blob/2.x.x/stylesheets/toolkit/_parallax.scss)

### How it works?

Parallax is simply the effect of depth because objects in the background move more slowly than objects in the foreground. Because we have 3d transforms and perspective objects in the background are smaller and move more slowly than objects in the foreground. If you lock the perspective to the view that is scrolling and preserve that perspective on child elements, a parallax effect will be visible. While these objects move at different speeds they are also scaled differently so this effect can be inverted using the `scale()` function of CSS transforms so things still move as if they are on different planes but the perspective no longer has impact on the scale of the element. All of this math sounds complicated, so it is bundled into easy to use mixins that can be applied with a given depth. You can also use this alongside other 3d transforms and the perspective shifts will happen to 3d boxes and things.

### Some background:

I have been playing with this technique [since late 2012](http://codepen.io/scottkellum/details/bwotf/) and have iterated on it a [few](http://codepen.io/scottkellum/details/yDhBm/) [times](http://www.theverge.com/2013/9/24/4698382/second-lifes-strange-second-life). My interest was peaked again with @keithclark’s [pen](http://codepen.io/keithclark/details/JycFw/) that really polished the experience and added `scale()` to the transforms bringing objects back out of perspective. I refined this so it was more mathematically repeatable with the help of [Brenna O'Brien](https://twitter.com/brnnbrn) and created Sass mixins to make the whole process really easy.