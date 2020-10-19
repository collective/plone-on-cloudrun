FROM plone

COPY site.cfg /plone/instance/
RUN apt-get update && apt-get install build-essential postgresql-server-dev-all -y
RUN buildout -c site.cfg \
 && find /data  -not -user plone -exec chown plone:plone {} \+ \
 && find /plone -not -user plone -exec chown plone:plone {} \+
RUN apt-get remove build-essential postgresql-server-dev-all -y
