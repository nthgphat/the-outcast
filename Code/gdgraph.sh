#!/bin/sh

classes=""
relations=""

for file in $(find . -name "*.gd"); do
    class_name="$(grep "class_name" "$file" | cut -f2 -d" ")"
    extends_name="$(grep "extends" "$file" | cut -f2 -d" ")"

    if [ -z "$class_name" ]; then
        continue
    fi

    classes="$classes\n$class_name\n$extends_name"
    relations="$relations\n\"$class_name\" -> \"$extends_name\""
done

classes="$(echo "$classes" | grep . | sort | uniq)"

echo "@startuml"
echo

echo "digraph "$(dirname $0)" {"
echo "$relations"
echo "}"

echo
echo "@enduml"
