##########################################################################################################################
##      Author: korggrodno
##        Mail: korggrodno@ya.ru
##        Date: October 2017 January February March April May June July August September October November December
##      Caveat: This script is provided free of charge 'as is'. No implied warranties or conditions. Use at your own risk
## Description: Возвращаем массив с русским алфавитом и с его произношением
##   Relations:
##     Example:
##########################################################################################################################

$alphabet =(("а","а-Аист"),
			("б","бэ-Бобр"),
			("в","вэ-Волк"),
			("г","гэ-Гусь"),
			("д","дэ-Дерево"),
			("е","е-Енот"),
			("ё","ё-Ежик"),
			("ж","жо-Жираф"),
			("з","зэ-Зелень"),
			("и","и-Ирина"),
			("й","й-Йод"),
			("к","ка-Кошка"),
			("л","эл-Ложка"),
			("м","эм-Муха"),
			("н","эн-Ноги"),
			("о","оо-Ольга"),
			("п","пэ-Папа"),
			("р","эр-Рыба"),
			("с","эс-Слива"),
			("т","тэ-Тигр"),
			("у","у-Утка"),
			("ф","эф-Флажок"),
			("х","ха-Хомяк"),
			("ц","цэ-Цапля"),
			("ч","че-Черепаха"),
			("ш","ши-Шарик"),
			("щ","ща-Щука"),
			("ъ","ъ"),
			("ы","ы-"),
			("ь","ь"),
			("э","э-Эврика"),
			("ю","ю-Юла"),
			("я","я-Ягель"))
return $alphabet

#$alphabet | % { if ( $str -eq $_[0]) { $speak.Speak($_[1]) }}