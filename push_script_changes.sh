#!/bin/bash

git branch -D rmgpy-rmg_tests_main_copy
git branch -c rmgpy-rmg_tests_main_copy
git checkout rmgpy-rmg_tests_main_copy
git commit --allow-empty -m "rmgpy-bcd469e65e09bcc94faa82aaa2ec002581e6fe5b"
git push -uf origin rmgpy-rmg_tests_main_copy

