pragma circom 2.0.0;
include "circomlib/circuits/comparators.circom";

template Vote() {
    signal input vote;
    signal output out1;
    signal output out2;
    signal output out3;

    component eq1 = IsEqual();
    eq1.in[0] <== vote;
    eq1.in[1] <== 1;

    component eq2 = IsEqual();
    eq2.in[0] <== vote;
    eq2.in[1] <== 2;

    component eq3 = IsEqual();
    eq3.in[0] <== vote;
    eq3.in[1] <== 3;

    signal sum;
    sum <== eq1.out + eq2.out + eq3.out;

    // Ensure only one vote is cast
    sum === 1;

    out1 <== eq1.out;
    out2 <== eq2.out;
    out3 <== eq3.out;
}

component main = Vote();
