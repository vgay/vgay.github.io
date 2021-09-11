
\version "2.19.80"
#(set-global-staff-size 18)
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  between-system-space = 2.5\cm
  between-system-padding = #0
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"I Can't Get Started"
composer = #"V. Duke & I. Gershwin"
meter = #"(Med. Swing)"
kwtempo = #"Medium"
kwstyle = #"Swing"

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
  % asplayed = #"" % doit être commentée si vide
  url = #""
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



form = \markup  \fill-line {
  \column {  }
  \column { \line { \with-color #red \fontsize #2 "Solos on AABBA then D.S. al Fine" } }
}

harmonies = \chordmode {
  \set chordChanges = ##t
s4. c2:7+ a:m7 d:m7 g:7 b4:m7 e:7 bes:m7 es:7 a:m7 d:7 as:m7 des:7 c2:7+ a:m7 d:m5-7 g:9- 
e:m5-7 a:9+ d:m7 g:7 c:7+ bes:7 c1:7+
e2:m7 a:7 e:m7 a:7 d:7+ g:7+ fis:m7 e:m7 d:m7 g:7 d:m7 g:7 c:7+ a:7 d:7 g:7
c2:7+ a:m7 d:m7 g:7 b4:m7 e:7 bes:m7 es:7 a:m7 d:7 as:m7 des:7 c2:7+ a:m7 d:m5-7 g:9-
c1:7+ \startParenthesis \parenthesize d2:m7 \endParenthesis \parenthesize g:7
}


theNotes =  \relative c' {
  \clef "treble" \key c \major \time 4/4
\partial 4. c8 e g \noBreak
\repeat volta 2 {
  \A
  b4 c8 a ~ a e f4 \noBreak | g2 ~ g8 e g b \noBreak | d4 e8 c ~ c g a4 \noBreak | b2 r8 c,8 e g |
  b4 c8 a ~ a e4 f8 | g4 g8 as ~ as c, d4 | 
}
\alternative {
  { e1 ~ | e4 r4 r8 c8 e g }
  { c1 | r4 c, e g }
}
\bar "||" \break
\B
a1 | fis8 fis fis fis ~ fis fis e4 | a1 | e8 e e e ~ e e d4 |  \break
a'1 | e8 e e e ~ e e d4 | a'4 r b r | d8 d4 b8 g c, e g \break \bar "||"
\A b4 c8 a ~ a e f4 | g2 ~ g8 e g b | d4 e8 c ~ c g a4 | b2 r8 c,8 e g | \break
b4 c8 a ~ a e4 f8 | g4 g8 as ~ as c, d4 | c1 | R1 
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
 \/c2:7+ a:m7 \/d:m7 g:7 \x b4:m7 e:7 bes:m7 es:7 \x a:m7 d:7 as:m7 des:7 \break
 \/c2:7+ a:m7 \/d:m5-7 g:9- \set Score.repeatCommands = #'((volta "1"))
 \/e:m5-7 a:9+ \s d:m7 g:7   \set Score.repeatCommands = #'((volta #f) end-repeat) \break
 \stopStaff s1 \bar "" s1 \startStaff \set Score.repeatCommands = #'((volta "2"))
 \/c2:7+ bes:7 c1:7+ \bar "||" \set Score.repeatCommands = #'((volta #f))
 \/e2:m7 a:7  \/e:m7 a:7 \/d:7+ g:7+ \/fis:m7 e:m7 \break
 \/d:m7 g:7  \/d:m7 g:7 \/c:7+ a:7 \/d:7 g:7 \break
  \/c2:7+ a:m7 \/d:m7 g:7 \x b4:m7 e:7 bes:m7 es:7 \x a:m7 d:7 as:m7 des:7 \break
 \/c2:7+ a:m7 \/d:m5-7 g:9- c1:7+ \/d2:m7 g:7 
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*11 
  s1 ^\markup \bold \box \fontsize #7 B s1*7 
  s1 ^\markup \bold \box \fontsize #7 A
}

verse = \lyricmode {
  I've flown a -- round the world in a plane
I've set -- tled re -- vo -- lu -- tions in Spain
The North Pole I have char -- ted
But can't get star -- ted with you

A -- round the 
\repeat unfold 4 { \skip 1 } 
"-preme," ly -- rics I write of you
Scheme, just for a sight of you
Dream, both day and night of you
And what good does it do?

In nein -- ty twen -- ty nine I sold short
In Eng -- land I'm pre -- sen -- ted at court
But you've got me down -- hearted
'Cause I can't get star -- ted with you
}

verseB = \lyricmode {
  \repeat unfold 3 { \skip 1 } golf course I'm un -- der par
And all the mo -- vies want me to star
I've got a house, a show place
But I get no place with you
\repeat unfold 4 { \skip 1 } You're so "su-"
}
\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "CTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
        >> 
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "BbTab") 
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
        >> 
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "EbTab")
  %\header { meter = \markup \with-color #red \bold "partition sur 2 pages" }
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c a \theNotes
        >> 
      >>
    } %\form
} }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
          \addlyrics \verse
          \addlyrics \verseB
        >> 
      >>
    } %\form
    }  \bookpart {
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
    page-count = #1
  }
  #(define output-suffix "Bba4") 
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
          \addlyrics \verse
          \addlyrics \verseB
        >> 
      >>
    } %\form
    }  \bookpart {
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
    page-count = #1
  }
  #(define output-suffix "Eba4")
  \bookpart {
    \score {
      <<
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice  
          \transpose c a \theNotes
          \addlyrics \verse
          \addlyrics \verseB
        >> 
      >>
    } %\form
    }  \bookpart {
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