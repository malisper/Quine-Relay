;; This is the code I used to create the quines. the function
;; gen-quine takes a quoted function of a single argument. It will
;; then generate a program which is equivalent to that function except
;; called with itself the source for itself. For example the code
;;
;; (gen-quine '(lambda (x) (list x x)))
;; 
;; will create a program which when ran, returns a list containing
;; itself twice. I was able to write gen-quine by using Kleene's
;; second recursion theorem.
(defun gen-quine (t-des)
  "Takes the description of a function T (the description should be a
   quoted lambda function) and generates a program R. When R is ran,
   it applies T to a description of R."
  `(funcall ,t-des
            (funcall (lambda (bt-des)
                       (let ((a ``,',bt-des))
                         `(funcall ,',t-des
                                   (funcall ,bt-des ,a))))
                     `,'(lambda (bt-des)
                         (let ((a ``,',bt-des))
                           `(funcall ,',t-des
                                     (funcall ,bt-des ,a)))))))

;; Here is what I passed to gen-quine in order to get the desired
;; program. It takes itself and writes a C program which prints
;; itself. I had some issue with newlines, since a a literal string in
;; C can't contain any newlines, so you may have to run the programs a
;; couple times before they have the exact same formatting as the
;; final ones.
(gen-quine '(lambda (self)
                       (format t "#include <stdio.h>~%int main ()~%{~%~%printf(\"%s\",~(~S~)~A"
                        (remove #\newline (prin1-to-string self)) ");
}
")))
