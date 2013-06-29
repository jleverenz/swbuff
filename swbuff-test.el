;; eval this buffer to run tests

(require 'swbuff)

(ert-deftest test-swbuff-include-test-helper-p ()
  (should (swbuff-include-test-helper-p "bufname" '("b.*")))
  (should (not (swbuff-include-test-helper-p "bufname" '("c.*")))))

(ert-deftest test-swbuff-include-p-default ()
  (let ((swbuff-include-buffer-regexps nil)
        (swbuff-exclude-buffer-regexps '("^ ")))  ;; matches default value
    (should (swbuff-include-p "bufname"))
    (should (swbuff-include-p "*scratch*"))))

(ert-deftest test-swbuff-include-p-custom ()
  (let ((swbuff-include-buffer-regexps nil)
        (swbuff-exclude-buffer-regexps '("^ " "^\*.*\*")))
    (should (swbuff-include-p "bufname"))
    (should (not (swbuff-include-p "*scratch*")))))

(ert-deftest test-swbuff-include-p-custom-with-excludes ()
  (let ((swbuff-include-buffer-regexps '("*scratch*"))
        (swbuff-exclude-buffer-regexps '("^ " "^\*.*\*")))
    (should (swbuff-include-p "bufname"))
    (should (not (swbuff-include-p "*Messages*")))
    (should (swbuff-include-p "*scratch*"))))

(ert "test-swbuff")
