# Open code and description.
alias o_c="vim $(<.file_path).{md,rb}"
# Open inputs.
alias o_i="vim $(<.dir)/{example,test}_input"
# Open example outputs.
alias o_e="vim $(<.dir)/example{1,2}_output"
# Open test inputs.
alias o_t="vim $(<.dir)/test{1,2}_output"
# Open 1 output.
alias o_1="vim $(<.dir)/{example,test}1_output"
# Open 1 output.
alias o_2="vim $(<.dir)/{example,test}2_output"

echo "o_c, o_i, o_1, o_2 are loaded."


