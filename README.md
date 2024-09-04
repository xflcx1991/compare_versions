仓颉版本号规则
===
一个合法的仓颉版本号是由三段数字组成，中间使用 . 隔开，每个数字均为自然数，且没有多余的前缀 0。——来自《仓颉编程语言工具使用指南》

例如
> 0.49.1 是一个合法的仓颉版本号；<br/> 
> 0.049.1 不是一个合法的仓颉版本号，049 中含有多余的前缀 0；<br/>
> 0.2e.1 不是一个合法的仓颉版本号，2e 不为自然数。

usage
===
Will return 1 if first version is greater, 0 if versions are equal, and -1 if the second version is greater:
```ts
import { compareVersions } from 'compare-versions';

compareVersions('11.1.1', '10.0.0'); //  1
compareVersions('10.0.0', '10.0.0'); //  0
compareVersions('10.0.0', '11.1.1'); // -1
```
Can also be used for sorting:
```ts
const sorted = versions.sort(compareVersions);
/*
[
  '1.2.3',
  '1.5.5',
  '1.5.19'
]
*/

```
"Human Readable" Compare
===
The alternative compare function accepts an operator which will be more familiar to humans:
```ts
import { compare } from 'compare-versions';

compare('10.1.8', '10.0.4', '>');  // true
compare('10.0.1', '10.0.1', '=');  // true
compare('10.1.1', '10.2.2', '<');  // true
compare('10.1.1', '10.2.2', '<='); // true
compare('10.1.1', '10.2.2', '>='); // false
```
Version ranges
===
The satisfies function accepts a range to compare, compatible with npm package versioning:
```ts
import { satisfies } from 'compare-versions';

satisfies('10.0.1', '~10.0.0');  // true
satisfies('10.1.0', '~10.0.0');  // false
satisfies('10.1.2', '^10.0.0');  // true
satisfies('11.0.0', '^10.0.0');  // false
satisfies('10.1.8', '>10.0.4');  // true
satisfies('10.0.1', '=10.0.1');  // true
satisfies('10.1.1', '<10.2.2');  // true
satisfies('10.1.1', '<=10.2.2'); // true
satisfies('10.1.1', '>=10.2.2'); // false
satisfies('1.4.6', '1.2.7 || >=1.2.9 <2.0.0'); // true
satisfies('1.2.8', '1.2.7 || >=1.2.9 <2.0.0'); // false
satisfies('1.5.1', '1.2.3 - 2.3.4'); // true
satisfies('2.3.5', '1.2.3 - 2.3.4'); // false
```
Validate version numbers
===
Applies the same rules used comparing version numbers and returns a boolean:
```ts
import { validate } from 'compare-versions';

validate('1.0.0-rc.1'); // true
validate('1.0-rc.1');   // false
validate('foo');        // false
```
Validate version numbers (strict)
===
Validate version numbers strictly according to semver.org; 3 integers, no wildcards, no leading zero or "v" etc:
```ts
import { validateStrict } from 'compare-versions';

validate('1.0.0');      // true
validate('1.0.0-rc.1'); // true
validate('1.0');        // false
validate('1.x');        // false
validate('v1.02');      // false
```
