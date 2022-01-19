
\version "2.19.80"
#(set-global-staff-size 18)
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 23)
                            (minimum-distance . 20)
                            (padding . 5))
}

title = #"A Felicidade"
composer = #"Tom Jobim"
meter = #"(Med. Up Bossa)"
kwtempo = #"Med. Up"
kwstyle = #"Bossa"

realBookTitle = \markup {
  \score {
    {
      \override TextScript.extra-offset = #'(0 . -4.5)
      s4
      s^\markup {
        \fill-line {
          \fontsize #1 \lower #1 \rotate #7 \concat { " " #meter }
          \fontsize #4
          \override #'(offset . 9)
          \override #'(thickness . 6)
          \underline \larger \larger #title
          \fontsize #1 \lower #1 \concat { #composer " " }
        }
      }
      s
    }
    \layout {
      \omit Staff.Clef
      \omit Staff.TimeSignature
      \omit Staff.KeySignature
      ragged-right = ##f
    }
  }
}

\header {
  pdftitle = #title
  pdfauthor = #composer
  pdfkeywords = \markup \concat { #kwtempo " " #kwstyle }
  title = \realBookTitle
  asplayed = #"Tom Jobim" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=gqhzemroh14"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
    startRepeatType = #"[|:"
    endRepeatType = #":|]"
    doubleRepeatType = #":|][|:"
    \override Clef #'break-visibility = #'#(#f #f #f)
    \override KeySignature #'break-visibility = #'#(#f #f #f)
    \override SystemStartBar #'collapse-height = #1
    \override ParenthesesItem.font-size = #2
  }
  \context { 
    \Staff
    printPartCombineTexts = ##f
    \consists "Merge_rests_engraver"
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
  %   \context { \RemoveEmptyStaffContext 				% ne pas imprimer les lignes vides (autres que la première)
  %              \override VerticalAxisGroup #'remove-first = ##t			% Concerne la première ligne
  %   }
}

voltaAdLib = \markup { \text \italic \fontsize#2  { Till Cue } }
voltaOnCue= \markup { \text \italic \fontsize#2 { On Cue } }


form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "" } }
}

harmonies = \chordmode {
  \set chordChanges = ##f
  s4 a1.:m f2:9 a:m a:m7+ a:m7 a:m6 
  e1:m7 b:9- e2:m7 a:7 d:m7 g:7 
  c1:7+ c2:6 a:9- d:m7 d:m7/c b:m5-7 e:7 
  a1:m d:m g:m7 c2:7 fis:5-7
  f1 e:7 a:m b2:m5-7 e:7
  a1:m b2:m5-7 e:7 a1:m d2:m7 g:9-
  c1 f:7 c1*2 g1:m7 c2:7 c:5+7 f1*2:6
  d1:m7 g:7 c1*2 fis2:m5-7 b:5+7 fis:m5-7 b:5+7 e:m5-7 a:9- d:m5-7 g:7
  c1*2 b1:m5-7 e:7 a:m b2:m5-7 e:7 a1*2:m
  a1.:m f2:9 a:m a:m7+ a:m7 a:m6  a:m a:m7+ a:m7 a:m6 a:m6
}


theNotes =  \relative c'' {
  \clef "treble" \key c \major \time 4/4
  \partial 4 e4 \A 
  \repeat volta 2 {
  a1 ~ | a4 c b g | e1 ~ | e2 r4 e4 |
  g2. e4 | fis2. dis4 |  e1 ~ | e2 r \bar "||" \break
  \B e1 ~ | e4 g f e | e d cis d | f4. f8~f4 e 
  d c b c | e d c d | bes1~ | bes2 r   \break
  r4 a c d | e e2 c4 | a c d e | d d2 e4
  a gis g c, | e dis  d c  |
  a1~ | a2 r  \bar "||" \break
  \C
  g4 a b c | a b c d | b a b2 | b2. r4
  c d e f d e c e | d1 | d2 r4 g   \bar "||" 
  g2 d4 g | g2 g4 a | a2 e4 a | a2 a4 b 
  b a \tuplet 3/2 { g fis g } | a a~ \tuplet 3/2 { a g fis } | 
  g2 \tuplet 3/2 { g4 f? e } | f f2 e4  \bar "||" \break
  c4 d e a e  d c a | d4 d2.~ | d2 r4 e 
  a gis g c, e dis d4 c | a a2.~ | a4 r r e' }
  \break 
  \repeat volta 2 { a1 ~ | a4 c b g  }
  \alternative { 
    { \set Score.repeatCommands = #(list(list 'volta voltaAdLib)) e1 ~ | e2 r4 e4   \set Score.repeatCommands = #(list '(volta #f) (list 'volta voltaOnCue) 'end-repeat) } 
    {  e1 ~ | 1 ~ | e1 \fermata \set Score.repeatCommands = #'((volta #f)) } } \bar ".."
}

verse = \lyricmode {
Tris -- te -- za __ não tem fim
Fe -- li -- ci -- da -- de, sim __

A __ fe -- li -- ci -- da -- de_é co -- mo_a plu -- ma
Que_o ven -- to vai le -- van -- do pe -- lo ar __
Vo -- a tão le -- ve
Mas tem a vi -- da bre -- ve
Pre -- ci -- sa que_ha -- ja ven -- to sem pa -- rar __

A fe -- li -- ci -- da-- de do po -- bre pa -- re -- ce
A gran -- de_i -- lu -- são do car -- na -- val  __ \skip 1
A gen -- te tra -- bal -- ha o a -- no in -- tei -- ro
Por um mo -- men -- to do son -- ho
Pra fa -- zer a fan -- ta -- si -- a de rei, 
ou de pi -- ra -- ta_ou jar -- di -- nei -- ra __
E tu -- do se_a -- ca -- bar na quar -- ta fei -- ra __ Tris
}

verseB = \lyricmode {
\skip 1 te -- za __ não tem fim
Fe -- li -- ci -- da -- de, sim __
A fe -- li -- ci -- da -- de_é co -- mo go -- ta de_or -- val --ho
Nu -- ma pé -- ta -- la de flor __
Bril -- ha tran -- qüi -- la
De -- pois de le -- ve_os -- ci -- la
E cai co -- mo_u -- ma lá -- gri -- ma de_a -- mor __

A min -- ha fe -- li -- ci -- da -- de_es -- tá bril -- han -- do
Nos ol -- hos da min -- ha na -- mo -- ra -- da
É co -- mo_es -- ta noi -- te
Pas -- san -- do, pas -- san -- do
Em bus -- ca da ma -- dru -- ga -- da
Fa -- lem ba -- i -- xo por fa -- vor
Pra que_e -- la_a -- cor -- de_a -- le -- gre co -- mo_o di -- a __
O -- fe -- re -- cen -- do be -- i -- jos do a -- mor
Tris -- te -- za nao tem fim __ Tris fim __
}

chordsRhythm = \relative c''' {
  \override Rest #'staff-position = #7
  \improvisationOn \override NoteHead.no-ledgers = ##t 
}

Basse = \relative c {
  \override Rest #'staff-position = #0
  \clef "bass" \key f \major \time 4/4
}

grille = \chordmode {
  \bar "[|:"
 a1:m \/a2:m f:9 \/a:m a:m7+ \/a:m7 a:m6 \break
 e1:m7 b:9- \/e2:m7 a:7 \/d:m7 g:7 \bar "||" \break
 c1:7+ \/c2:6 a:9- \/d:m7 d:m/c \/b:m5-7 e:7 \break
 a1:m d:m g:m7 \/c2:7 fis:5-7  \break
 f1 e:7 a:m \/b2:m5-7 e:7 \break
 a1:m \/b2:m5-7 e:7 a1:m \/d2:m7 g:9- \bar "||" \break
 c1 f:7 \repeat percent 2 c \break
 g:m7 \/c2:7 c:5+7 \repeat percent 2 f1:6 \break
 d:m7 g:7 \repeat percent 2 c \break
 \/fis2:m5-7 b:5+7  \/fis2:m5-7 b:5+7  \/e:m5-7 a:9- \/ d:m5-7 g:7 \break
 \repeat percent 2 c1 b:m5-7 e:7 \break
 a:m \/b2:m5-7 e:7 \repeat percent 2 a1:m \bar ":|][|:" \break
  \Coda a1:m \/a2:m f:9 \/a:m a:m7+ \/a:m7 a:m6 \bar ":|]" \break
a1:m6 \stopStaff s1 \bar "" s1 \bar "" s1 \bar ""
}

marques = \relative c' { 
s1 ^\markup \bold \box \fontsize #4 A s1*7 
s1 ^\markup \bold \box \fontsize #4 B s1*15 
s1 ^\markup \bold \box \fontsize #4 C s1*27 
s2 \once \override TextScript #'extra-offset = #'( -2 . -3 ) 
s2 ^\markup \bold \musicglyph "scripts.ufermata"
}


\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "CTab")
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
        >> 
      >>
    } \form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "BbTab") 
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
        >> 
      >>
    } \form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  #(define output-suffix "EbTab")
  \header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c a, \theNotes
        >> 
      >>
    } \form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #2
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes \addlyrics \verse \addlyrics \verseB
        >> 
      >>
    } \form \pageBreak
    %}  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #2
  }
  #(define output-suffix "Bba4") 
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes \addlyrics \verse \addlyrics \verseB
        >> 
      >>
    } \form \pageBreak
    %}  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \transpose c d \grille
      >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #2
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice  
          \transpose c a, \theNotes \addlyrics \verse \addlyrics \verseB
        >> 
      >>
    } \form \pageBreak
    %}  \bookpart {
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
          \remove "Volta_engraver"
          \omit Clef % Cacher la clef
          \omit TimeSignature % cacher la métrique
          \omit BarNumber             
          \override SpacingSpanner.strict-note-spacing = ##t
          proportionalNotationDuration = #(ly:make-moment 1/16)
        }
      }
      <<
        \new Staff \with {
          \remove "Staff_symbol_engraver"
        }    
        \marques
        \new ChordNames \with {
          \override ChordName.extra-offset = #'(10 . -1 )         
          \override ParenthesesItem.extra-offset = #'(10 . -1 ) 
          \override BarLine.bar-extent = #'(-5 . 5)
          \consists "Bar_engraver"
          \override StaffSymbol.line-positions = #'( -10 10 ) 
          \consists "Staff_symbol_engraver"
          \consists "Percent_repeat_engraver"
          \consists "Volta_engraver"
        }
        \transpose c a \grille
      >>
} } }