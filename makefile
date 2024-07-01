auto_generate:
	dart run build_runner build --delete-conflicting-outputs

create:
	@read -p "Enter folder name: " folder_name; \
	read -p "Enter file name: " file_name; \
	mkdir -p lib/features/$$folder_name/data; \
	mkdir -p lib/features/$$folder_name/pages; \
	mkdir -p lib/features/$$folder_name/notifiers; \
	mkdir -p lib/features/$$folder_name/widgets; \
	echo "Folder $$folder_name created"; \
	touch lib/features/$$folder_name/pages/$$folder_name.dart; \
	sed "s/{{PLACEHOLDER}}/$$file_name/g" stubs/main_file.dart.stub > lib/features/$$folder_name/pages/$$folder_name.dart; \
	echo "Files created inside $$folder_name."
