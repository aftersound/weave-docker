#!/bin/bash
cd ..
weavehome=`pwd`

# prepare classpath
classpath=''
# service core libraries
for file in $weavehome/service/library/core/*; do
  if [[ $file == *.jar ]]
  then
    classpath+=$file
    classpath+=":"
  fi
done

# extras, including
#   service extensions
#   third-party libraries
#   schema libraries
for file in $weavehome/service/library/extra/*; do
  if [[ $file == *.jar ]]
  then
    classpath+=$file
    classpath+=":"
  fi
done

java -DWEAVE_HOME=$weavehome -XX:TieredStopAtLevel=1 -XX:TieredStopAtLevel=1 -noverify -Dspring.output.ansi.enabled=always -Dcom.sun.management.jmxremote -Dspring.jmx.enabled=true -Dspring.liveBeansView.mbeanDomain -Dspring.application.admin.enabled=true -Dfile.encoding=UTF-8 -classpath "$classpath" -Dspring.config.location=$weavehome/service/$NAMESPACE.properties io.aftersound.weave.service.Application