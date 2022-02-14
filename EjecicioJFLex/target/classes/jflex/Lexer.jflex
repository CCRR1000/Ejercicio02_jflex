/*Primer sección: código de usuario*/
package jflex;
%%

/*Segunda sección: configuración*/
%class Lexer
%public
%unicode
%line
%column
%int

ESPACIO = [\ |\n|\r|\t|\f]
VOCAL = [A|E|I|O|U|a|e|i|o|u]
NUMERO = [0-9]
ENTERO = ({NUMERO})+

%{
    int countVocal=0;
    //int vocal1=0, vocal2=0, vocal3=0, vocal4=0, vocal5=0;
    int contPalabras[] = {0,0,0,0,0};
	
    public void increaseCount(){
	countVocal++;
    }

    public void actualizarConteo(){
	switch (countVocal) {
            case 1:
                //vocal1++;
                contPalabras[0]++;
                break;
            case 2:
                //vocal2++;
                contPalabras[1]++;
                break;
            case 3:
                //vocal3++;
                contPalabras[2]++;
            	break;
            case 4:
                //vocal4++;
                contPalabras[3]++;
                break;
            case 5:
                //vocal5++;
                contPalabras[4]++;
                break;
            default:
                break;
        }

        countVocal=0;
    }

    public int getContPalabras(int numVocal){
	return contPalabras[numVocal];
    }

%}

%eof{
	System.out.println("Palabras con:");
	System.out.println("1 vocal: " + getContPalabras(0));
	System.out.println("2 vocal: " + getContPalabras(1));
	System.out.println("3 vocal: " + getContPalabras(2));
	System.out.println("4 vocal: " + getContPalabras(3));
	System.out.println("5 vocal: " + getContPalabras(4));
%eof}

%%

/*Tercer sección: reglas léxicas*/

{VOCAL} {increaseCount();}
{ENTERO} {System.out.println("Entero");}
{ESPACIO} {actualizarConteo();}





