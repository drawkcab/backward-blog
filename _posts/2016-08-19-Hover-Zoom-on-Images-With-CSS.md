---
layout: post
title: Hover Zoom on Images With CSS
excerpt: "The goal of this post is to reproduce an effect I saw which on mouse over the image would zoom in using only CSS."
categories: [CSS]
modified: 2014-09-14
comments: true
---

The goal of this post is to reproduce an effect I saw which on mouse over the image would zoom in using only CSS.

## Functionality

The plan is to use CSS transforms to animate because of all the benefits for speed and smoothness from animating this way. The set up will use `<div>` instead of `<img>` tag for the main structure.

```html
<div class="outer">
  <div class="inner"></div>
</div>
```

Next lets set outer div dimensions and then fill the inner div to take up all the space.

```css
.outer {
  height: 400px;
  width: 600px;
  overflow:hidden;
}
.inner {
  background-color: black;
  background-image: url("image/yourimage.jpg");
  background-position: center;
  background-size: cover;
  height: 100%;
  width:100%;
}
```

With our base set all we have at this point is an image inside a `<div>`.

Now lets add some effects on hover.


```css
.outer:hover .inner,
.outer:focus .inner {
  transform: scale(1.2);
}
```

Lets make the animation smooth and add a transition.

```css
transition: all .5s;
```
This has the effect but lets add to it. Lets add a color overlay and some text when you over over the image. First we need to add a `::before` pseudo element.

```css
.inner::before {
  background-color: rgba:(192, 192, 192, .5);
  display: none;
  content:"stuff";
  height: 100%;
  width: 100%;
  position: absolute;
  left: 0;
  top:0;
}

.outer:hover .inner:before,
.outer:focus .inner:before {
  display:block;
}
```

Awesome! At this point when we hover over the image the image will increase in size and add our new color overlay.

Next we need have our text appear when we have our color show.

```html
<div class="outer">
  <div class="inner">
    <span>Awesome!</span>
  </div>
</div>
```

Now we need a little more styling for this span.

```css
span {
  color: tomato;
  font-family: sans-serif;/* fall back style just incase of errors in browsers */
  padding: 20%;
  position: absolute;
  display: none;
}
```

We are almost there. We have to set up the span to only show when we hover over image.

```css
.outer:hover span,
.outer:focus span {
  display: block;
}
```

Great! This effect works great when having multiple images on a page that you want to use as links. It adds an effect that shows the user that this is a link or where your courser is and also shows text which describes what the link or image is.

[Here is my example to play around with.](http://codepen.io/mjroche/pen/zBXLYZ)
