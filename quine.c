#include <stdio.h>
int main ()
{

printf("%s","(funcall (lambda (self)   (format t \"#include <stdio.h>~%int main ()~%{~%~%printf(\\\"%s\\\",~(~s~)~a\"           (remove #\\newline (prin1-to-string self)) \");}\")) (funcall  (lambda (bt-des)    (let ((a ``,',bt-des))      `(funcall        ,'(lambda (self)            (format t                    \"#include <stdio.h>~%int main ()~%{~%~%printf(\\\"%s\\\",~(~s~)~a\"                    (remove #\\newline (prin1-to-string self)) \");}\"))        (funcall ,bt-des ,a))))  `,'(lambda (bt-des)       (let ((a ``,',bt-des))         `(funcall           ,'(lambda (self)               (format t                       \"#include <stdio.h>~%int main ()~%{~%~%printf(\\\"%s\\\",~(~s~)~a\"                       (remove #\\newline (prin1-to-string self)) \");}\"))           (funcall ,bt-des ,a))))))");}
