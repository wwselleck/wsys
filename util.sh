link() {
  original_file=$1
  link_path=$2

  if [[ -L "$link_path" ]]; then
        existing_file_linked_to=$(readlink "$link_path")

        if [[ "$existing_file_linked_to" = "$original_file" ]]; then
            echo "$link_path already linked to $original_file, skipping"
            return 0
        fi

        echo "$link_path is already a link ["$existing_file_linked_to"] "
        read -p "Do you want to unlink it (y/n)? " should_unlink
        echo $should_unlink
        if [[ $should_unlink = 'y' ]]; then
            unlink $link_path
            echo "Linking $2 to $1"
            ln -s $1 $2
        else
            echo "Keepig existing link"
        fi
  fi
}
