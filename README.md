# RecursiveWriteBarrier
Recursive versions of `Object>>beReadOnlyObject`, `Object>>beWritableObject`, and `Object>>setIsReadOnlyObject` for Pharo

To install in Pharo 7, execute the following lines in a playground:
```
Metacello new
    baseline: 'Leibniz';
    repository: 'github://khinsen/RecursiveWriteBarrier/src';
    load.
```
