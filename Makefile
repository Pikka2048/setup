setup_tool: setup_ui.cpp
	g++ setup_ui.cpp -o setup_tool -lncursesw -ltinfo -static-libstdc++ -static-libgcc

clean:
	rm -f setup_tool
