ansible-playbook -i tests/inventory tests/test_all.yml --syntax-check
ansible-playbook -i tests/inventory tests/test_all.yml --connection=local --sudo
ansible-playbook -i tests/inventory tests/test_machine.yml --connection=local --sudo
ansible-playbook -i tests/inventory tests/test_destroy.yml --connection=local --sudo

ansible-playbook -i tests/inventory tests/test_all.yml --connection=local --sudo | grep -q 'changed=0.*failed=0' && (echo 'Idempotence test: pass' && exit 0) || (echo 'Idempotence test: fail' && exit 1)