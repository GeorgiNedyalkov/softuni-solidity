function calcFactorialWhile(num) {
    let factorial = 1;

    while (num > 0) {
        factorial = factorial * num;
        num--;
    }

    return factorial;
}

function calcFactorialFor(num) {
    let factorial = 1;

    for (let i = num; i > 0; i--) {
        factorial *= i;
    }

    return factorial;
}

console.log(calcFactorialFor(5));