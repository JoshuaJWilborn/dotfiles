confirm() {
  QUIT="Exit"
  PS3=$1
  select CHOICE in Yes No $QUIT;
  do
    case $CHOICE in
      Yes)
        return 0
        break
        ;;
      No)
        return 1
        break
        ;;
      "$QUIT")
        echo "Exiting."
        exit 1 
        ;;
    esac
  done
}
