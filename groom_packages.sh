#!/usr/bin/env bash
DRY_RUN="${1}"
for package_name in `ls -1 packages/cache/local-pypi/storage | grep -v '\.'`; do
    package_path="packages/cache/local-pypi/storage/${package_name}/"
    for package_file in `ls -lt1 packages/cache/local-pypi/storage/${package_name}/ | grep -v '\.meta$' | tail +2`; do
       if [ "${DRY_RUN}" == "1" ]; then
         echo "would remove file ${package_file}";
         echo "would remove file ${package_file}.meta";
       else
         echo "git rm ${package_path}/${package_file}";
         git rm "${package_path}/${package_file}";
         echo "git rm ${package_path}/${package_file}.meta";
         git rm "${package_path}/${package_file}.meta";
       fi;
    done
done
