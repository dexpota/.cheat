<!-- vim: syntax=Markdown -->
# Bash

```bash
# only parses the script, without running it 
bash -n <script>
# verbose output
bash -v <script>
# trace script execution
bash -x <script>
```

```bash
# treat unset variables as an error
set -o nounset
# trace script execution
set -o xtrace
# PS4 is expanded before each command displays, during an execution trace
```

## Arithmetic Expansion
It is possible to performs integer arithmetic operations using arithmetic
expansion. The followings are three different variations on arithmetic
expansion.

- Using the command `expr` and the backticks: ``RESULT=`expr EXPRESSION` ``;

- Using double parentheses:
	- as a command `(( EXPRESSION ))`, this returns 0 if expression is different is different from zero, else 1;
	- as an interpolation `VARIABLE=$(( EXPRESSION ))`, this returns the value of the expression;

- Using the command `let`: `let EXPRESSION`;

## Parameter substitution

| command                 | description                                                                |
|-------------------------|----------------------------------------------------------------------------|
| ${parameter} $parameter | value of the variable *parameter*                                          |
| ${parameter-default}    | if the *parameter* is not set, use *default*                               |
| ${parameter:-default}   | if the *parameter* is set but null, use *default*                          |
| ${parameter=default}    | if the *parameter* is not set, set it to *default*                         |
| ${parameter:=default}   | if the *parameter* is set but null, set it to *default*                    |
| ${parameter+alt_value}  | if the *parameter* is set, use *alt_value*, else use *null*                |
| ${parameter:+alt_value} | if the *parameter* is set and not null, use *alt_value*, else use *null*   |
| ${parameter?err_msg}    | if *parameter* is set, use it, else print *err_msg* and abort              |
| ${parameter:?err_msg}   | if *parameter* is set and not null, use it, else print *err_msg* and abort |

| command         | description                                                    |
|-----------------|----------------------------------------------------------------|
| ${#var}         | string length, for an array the length of the first element    |
| ${var#pattern}  | remove from the front of *var* the shortest match of *pattern* |
| ${var##pattern} | remove from the front of *var* the longest match of *pattern*  |
| ${var%pattern}  | remove from the back of *var* the shortest match of *pattern*  |
| ${var%%pattern} | remove from the back of *var* the longest match of *pattern*   |

| command                        | description                                                                           |
|--------------------------------|---------------------------------------------------------------------------------------|
| ${var:pos}                     | expand *var* starting from offset *pos*                                               |
| ${var:pos:len}                 | expand a maximum of *len* characters of *var*, starting from offset *pos*             |
| ${var/pattern/replacement}     | replace the first match of *pattern*, within *var*, with *replacement*                |
| ${var//pattern/replacement}    | replace all matches of *pattern*, within *var*, with *replacement*                    |
| ${var/#pattern/replacement}    | if the start of *var* matches *pattern*, then substitute the match with *replacement* |
| ${var/%Pattern/Replacement}    | if the end of *var* matches *pattern*, then substitute the match with *replacement*   |
| ${!varprefix*}, ${!varprefix@} | expand to all variable's names matching *varprefix*                                   |

# Recipies

## Check the return code of a command
```bash
if [ $? -eq 0]; then
	echo OK
else
	echo FAIL
fi
```
