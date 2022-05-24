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




function recursiveFactorial(factorial) {
    let result = 1;
    let factorialNumber = factorial;

    if (factorial == 0) {
        return result;
    } else {
        return factorialNumber * recursiveFactorial(--factorial);
    }
}

console.log(recursiveFactorial(5));