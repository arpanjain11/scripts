DUMP_DIR=/orac
FILENAME_PREFIX="testdump"
FILE_SIZES="128M 256M 512M 1024M"
for I in $FILE_SIZES; do
  FILENAME="$FILENAME_PREFIX""$I"
   echo WRITE: Stream $FILE_SIZE
  cmd="time (dd if=/dev/zero of=$DUMP_DIR/$FILENAME bs=$I oflag=direct count=1 && sync)"
  eval $cmd
  echo READ: Stream $FILE_SIZE
  cmd="time (dd of=/dev/null if=$DUMP_DIR/$FILENAME bs=$I) && sync"
  eval $cmd
  rm -f $DUMP_DIR/$FILENAME
  sync
done