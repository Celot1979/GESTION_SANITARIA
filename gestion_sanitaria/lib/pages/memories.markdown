bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white, // Color de fondo del contenedor
          border: Border(
            top: BorderSide(
              color: Colors.grey, // Color del borde
              width: 4.0, // Grosor del borde
            ),
          ),
        ),
        child: BottomNavigationBar(
          
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'LIST',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'HOME',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.blue, // Color del ítem seleccionado
          unselectedItemColor: Colors.blue, // Color del ítem no seleccionado
        ),
      ),

    MediaQuery.of(context)