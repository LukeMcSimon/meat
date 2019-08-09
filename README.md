# How to work with these Class Files

These class files use Git to iteratively build each step of each exercise.  When you first clone this repository, you will be at the tip of the **master** branch—this is the final, "finished" version of the exercise.

We've made best efforts to make these exercises portable between environments, but there can always be issues.  When you first check out this repository, we recommend running a few commands to sanity check things:

```
> git clone git@bitbucket.org:noble-desktop/nutty.git
> cd nutty
> bundle
> yarn install --check-files
```

## Jumping to a particular exercise

We have created tags corresponding to the finished state of each exercise.  So, if you want to start from exercise 9A, you can run:

```
git checkout 8D
```

To get the site finished through Exercise 8D.

If you hit unexpected issues after checking out a given exercise, try running `bundle` and `yarn install --check-files` again.

## Comparing the differences between versions

If you're feeling adventurous, you can use `git diff` to examine the differences between versions.  For example:

```
git diff 8D 9A
```

Will show you everything that changed between 8D and 9A.