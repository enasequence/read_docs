=================================================
How to Cache CRAM Reference Sequences using Squid
=================================================

To reduce network traffic originating from the use of the CRAM Reference Registry we recommend using locally
cached reference sequences. In addition to local caches supported by Samtools it is possible to cache sequences
using an HTTP proxy.

In the example below, the Squid is used as a reverse proxy to cache reference sequences retrieved from the
CRAM Reference Registry.

Setting up Squid reverse proxy
------------------------------

1. Download and install Squid.

If a binary package is not available for `download <http://www.squid-cache.org/Versions/>`_ then Squid can also be
compiled from source.  We recommend that you install version 3.1 or later.

2. Create directories for the cache files, log files and the Squid configuration file.

In the example below we have created directories under /data/squid but any directory accessible to the user running
Squid can be used after it has been defined in the Squid configuration file.

+-------------------+--------------------------------------------+
| Directory         | Description                                |
+-------------------+--------------------------------------------+
| /data/squid/cache | Used to store the local squid cache        |
+-------------------+--------------------------------------------+
| /data/squid/log   | Used to store the Squid log files          |
+-------------------+--------------------------------------------+
| /data/squid/conf  | Used to store the Squid configuration file |
+-------------------+--------------------------------------------+

3. Create the Squid configuration file.

The following configuration file in /data/squid/conf will cache locally reference sequences retrieved from the CRAM
Reference Registry. Parameter values that should be configured locally are bolded.

.. code-block:: bash

   max_filedesc 4096
   cache_mem <memory>
   maximum_object_size_in_memory 512 MB
   maximum_object_size 1024 MB
   http_port <port> accel defaultsite=<hostname> vhost
   #forwarded_for on
   cache_peer www.ebi.ac.uk parent 80 0 no-query originserver name=myAccel
   cache_dir ufs /data/squid/cache 65536 16 256
   acl mysites dstdomain ebi.ac.uk
   acl all src all
   http_access allow mysites
   http_access allow all
   cache_peer_access myAccel allow mysites
   cache_peer_access myAccel allow all
   access_log /data/squid/log/access.log
   cache_store_log /data/squid/log/store.log
   cache_log /data/squid/log/cache.log

+--------------+----------+------------------------------------------------------------------+
| Parameter    | Example  |                                                                  |
+--------------+----------+------------------------------------------------------------------+
| <port>       | 8080     | | The HTTP port the Squid server is configured to use.           |
|              |          | | Please note that ports below 1024 require root privileges.     |
+--------------+----------+------------------------------------------------------------------+
| <hostname>   |          | Must match the hostname of the machine running the Squid server. |
+--------------+----------+------------------------------------------------------------------+
| <memory>     | 10048 MB | | The amount of memory reserved for Squid cache. It is           |
|              |          | | recommended that this does not exceed 70% of the available     |
|              |          | | physical memory. If the number of objects that is being cached |
|              |          | | exceeds the available memory then the cache will write the     |
|              |          | | retrieved reference sequences to the Squid cache directory.    |
+--------------+----------+------------------------------------------------------------------+

4. Initialize Squid.

Execute the following command:

.. code-block:: bash

   squid -f /data/squid/conf/squid.conf -z

5. Start up Squid.

Execute the following command:

.. code-block:: bash

   squid -f /data/squid/conf/squid.conf

This will start the squid process as a daemon so that it runs in the background. If you wish, you can execute squid
in the foreground by adding the parameter -N.

6. Configuring Samtools to use Squid.

In Samtools, the **REF_CACHE** environment variable is used to indicate that any downloaded reference sequences are
stored locally in the specified directory in order to avoid subsequent downloads.

If you wish SAMTools to cache retrieved sequences in addition to caching them in Squid then you should define both
**REF_PATH** and **REF_CACHE** environment variables:

.. code-block:: bash

   export REF_PATH=<dir>/%2s/%2s/%s:http://<hostname>:<port>/ena/cram/md5/%s
   export REF_CACHE=/<dir>/%2s/%2s/%s

where **<hostname>** and **<port>** are the ones used by the Squid server, and the **<dir>** is the directory path
used by SAMTools for its cache. The %2s/%2s/%s syntax informs SAMTools to store the sequences in sub-directories
first using the first two digits and then using the second two digits of the MD5 checksum. This helps to avoid
one large directory with thousands of files in it.

If you wish to cache reference sequences only in the Squid cache then only the REF_PATH environment variable
should be defined:

.. code-block:: bash

   export REF_PATH=http://<hostname>:<port>/ena/cram/md5/%s

7. Configuring CRAMToolkit to use Squid.

CRAMTools can be instructed to use the Squid cache by defining the following Java property:

.. code-block:: bash

   java -DREF_URL_TEMPLATE=http://<hostname>:<port>/ena/cram/md5/%s

where **<hostname>** and **<port>** are the ones used by the Squid server.

8. Testing Squid.

Execute the following command to test the cache:

.. code-block:: bash

   curl -v http://<hostname>:<port>/ena/cram/md5/9aff30af7b14df874594c8ed07b279ba | md5

The computed md5 checksum should match the requested entry.  The cache status of the request can be determined by
checking the /data/squid/log/access.log file. The cache status is available in the fourth column of the access log
and can be one of the following:

+-----------------+---------------------------------------------------------------------+
| Status          | Description                                                         |
+-----------------+---------------------------------------------------------------------+
| TCP_MISS/200    | | The requested object is not available in the cache, the request   |
|                 | | was forwarded on to the cache peer.                               |
+-----------------+---------------------------------------------------------------------+
| TCP_HIT/200     | | The requested object is available in the Squid disk cache.        |
+-----------------+---------------------------------------------------------------------+
| TCP_MEM_HIT/200 |	The requested object is available in the Squid memory cache.        |
+-----------------+---------------------------------------------------------------------+

9. Shut down Squid.

To gracefully shut down the squid daemon process, execute the following command:

.. code-block:: bash

   squid -k shutdown


