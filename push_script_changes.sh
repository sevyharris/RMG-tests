#!/bin/bash

git branch -D rmgpy-rmg_tests_main_copy
git branch -c rmgpy-rmg_tests_main_copy
git checkout rmgpy-rmg_tests_main_copy
git commit --allow-empty -m "rmgpy-7e4849b7890b4b7d5e6ba03f8535a48b1d1f0798"
git push -uf origin rmgpy-rmg_tests_main_copy

