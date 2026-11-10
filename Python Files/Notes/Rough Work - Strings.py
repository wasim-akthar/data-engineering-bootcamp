# CASE CONVERSION METHODS

case_sentence = "I'm a dAtA EngIneeR"

print(
  'Case Sentence :', case_sentence,
  '\nUPPERCASE :', case_sentence.upper(),
  '\nlowercase :', case_sentence.lower(),
  '\nTitle Case :', case_sentence.title(),
  '\nsWAP cASE :', case_sentence.swapcase(),
  '\ncasefold :', case_sentence.casefold()
)

# SEARCHING METHODS

search_sentence = "I am a spider sensing man"

print(
  '\n\nSearch Sentence :', search_sentence,
  '\nFind :', search_sentence.find('s'),
  '\nCount :', search_sentence.count('m'),
  '\nrfind :', search_sentence.rfind('a'),
  '\nindex :', search_sentence.index('man'),
  '\nstartswith :', search_sentence.startswith('spi'),
  '\nendswith :', search_sentence.endswith('der')
)

# STRIPPING METHODS

strip_sentence = "  A  Good  Morning     to you "

print(
  '\n\nStrip Sentence :', strip_sentence,
  '\nstrip :', strip_sentence.strip(),
  '\nlstrip :', strip_sentence.lstrip(),
  '\nrstrip :', strip_sentence.rstrip() 
)

# REPLACING AND SPLIT METHODS

replace_split_string = " A fox, a cow , a herd of sheep and it's owner "

print(
  '\n\nReplace Split Sentence :', replace_split_string,
  '\nReplace :', replace_split_string.replace('fox', 'wolf'),
  '\nsplit :', replace_split_string.split(','),
  '\nrsplit :', replace_split_string.rsplit(','),
  '\njoin :', replace_split_string.join(','),
  '\nPartition :', replace_split_string.partition(',')
)

print("\n--- 6E. CHARACTER INSPECTION (is... methods) ---")
print("'12345'.isdigit():", "12345".isdigit())         # True (Digits only)
print("'Alpha'.isalpha():", "Alpha".isalpha())         # True (Alphabetic only)
print("'Alpha123'.isalnum():", "Alpha123".isalnum())   # True (Alphanumeric)
print("'   '.isspace():", "   ".isspace())             # True (Whitespace only)
print("'data'.islower():", "data".islower())           # True
print("'DATA'.isupper():", "DATA".isupper())           # True
print("'Data Engineer'.istitle():", "Data Engineer".istitle()) # True
print("'123.45'.isdecimal()", "123.45".isdecimal()) # True
print("'user_id'.isidentifier():", "user_id".isidentifier())   # True (Valid variable name)
print("'print'.isascii():", "print".isascii())         # True (ASCII chars only)


# JOINING AND ALIGNMENT METHODS

colors = ['red', 'blue', 'green', 'yellow', 'pink', 'black', 'white']
print(" ".join(colors))
print("I'm a good boy".center(20, '$')) 
print("I'm a good boy".ljust(20, '`'))
print("I'm a good boy".rjust(20, '|'))
print("12345".zfill(10))

# STRING FORMATTING METHODS

print('Concatenation :', "Wasim" + ' ' + "Akthar")
print('Repetition :', ("\nEngineer" + " ")*5)

# MEMBERSHIP OPERATORS

membership_sentence = "wasim akthar is a data engineer in january"
print("IN Operator :", 'january' in membership_sentence)
print("NOT IN Operator :", 'akthar' not in membership_sentence)

# BASIC OPERATORS

basic_sentence = 'holly_wood is My dream pLACE'
print('Length :', len(basic_sentence))

# COMPARISON OPERATORS

subject, course, language  = 'Python', 'python', 'C#'

print("Equal To :", subject == course)
print("Not Equal To :", subject != course)
print("More Than :", subject > course)
print("Less Than :", subject < course)
print("More Than OR Equal To :", subject >= language)
print("Less Than OR Equal To :", subject <= language)

