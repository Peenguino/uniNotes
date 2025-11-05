//notazione polacca inversa --- esercizio su stack

function notazionePolaccaInversa (exp)
{
    let stack = [], opr1, opr2, res
    for(let elem of exp)
    {
        switch (elem)
        {
            case "+":
                opr2 = stack.pop()
                opr1 = stack.pop()
                res = Number (opr1) + Number (opr2)
                stack.push("" + res)
                break;
            case "-":
                opr2 = stack.pop()
                opr1 = stack.pop()
                res = Number (opr1) - Number (opr2)
                stack.push("" + res)
                break;
            case "*":
                opr2 = stack.pop()
                opr1 = stack.pop()
                res = Number (opr1) * Number (opr2)
                stack.push("" + res)
                break;
            case "/":
                opr2 = stack.pop()
                opr1 = stack.pop()
                res = Number (opr1) + Number (opr2)
                stack.push("" + res)
                break;
            default:
                stack.push(elem)
        }
    }

    return stack[0]
}

//==== ESEMPI D'UTILIZZO

expr = "12+7*"

notazionePolaccaInversa(expr)
