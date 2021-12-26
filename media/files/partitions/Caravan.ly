\version "2.22.1"
#(set-global-staff-size 18)
\include "double-mark.ly"
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

title = #"Caravan"
composer = #"Duke Ellington and Juan Tizol"
meter = #"(Latin Swing)"
kwtempo = #"Medium"
kwstyle = #"Latin / Swing"

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
  c1:9- \parenthesize des:5+7.9-11+ c1*2:9- c1:9- \parenthesize des:5+7.9-11+ 
  c1*2:9- c1:9- \parenthesize des:5+7.9-11+ c1*2:9- f1:m7 f:m6 f:m7 f:m6
  f1*4:9 bes:9 es:7 as1*2:6 c:7
  c1:9- \parenthesize des:5+7.9-11+ c1*2:9- c1:9- \parenthesize des:5+7.9-11+ 
  c1*2:9- c1:9- \parenthesize des:5+7.9-11+ c1*2:9- f1:m7 f:m6 f:m7 f:m6
}
harmoniesV = \chordmode {
  \set chordChanges = ##t
  c1:9- \parenthesize des:5+7.9-11+ c1*2:9- c1:9- \parenthesize des:5+7.9-11+ 
  c1*2:9- c1:9- \parenthesize des:5+7.9-11+ c1*2:9- f1:m7 f:m6 f:m7 f:m6
  f1*4:9- bes:9 es:7 as1*2:6 c:7
  c1:9- \parenthesize des:5+7.9-11+ c1*2:9- c1:9- \parenthesize des:5+7.9-11+ 
  c1*2:9- c1:9- \parenthesize des:5+7.9-11+ c1*2:9- f1:m7 f:m6 f:m7 f:m6
}
harmoniesT = \chordmode {
  \set chordChanges = ##t
  c1:9- \parenthesize des:5+7.9-11+ c1*2:9- c1:9- \parenthesize des:5+7.9-11+ 
  c1*2:9- c1:9- \parenthesize des:5+7.9-11+ c1*2:9- f1:m7 f:m6 f:m7 f:m6
  f1*4:9 bes:9 es:7 as1*2:6 c:7
}

hsup = \chordmode {
  \set chordChanges = ##t
  \override ChordNames.ChordName.font-size = #-2
  s1*12
  \startParenthesis \parenthesize 
  f2:m7 bes:13 es:9 as:13 des:9 c:5+7.9-11+ 
  \endParenthesis \parenthesize 
  f1:m6.9
  s1*14 \startParenthesis \parenthesize g1:7
  \endParenthesis \parenthesize des:5-7
  s1*12
  \startParenthesis \parenthesize 
  f2:m7 bes:13 es:9 as:13 des:9 c:5+7.9-11+ 
  \endParenthesis \parenthesize 
  f1:m6.9
}
hsupT = \chordmode {
  \set chordChanges = ##t
  \override ChordNames.ChordName.font-size = #-2
  s1*12
  \startParenthesis \parenthesize 
  f2:m7 bes:13 es:9 as:13 des:9 c:5+7.9-11+ 
  \endParenthesis \parenthesize 
  f1:m6.9
  s1*14 \startParenthesis \parenthesize g1:7
  \endParenthesis \parenthesize des:5-7
}

theNotes =  \relative c'' {
  \clef "treble" \key f \minor \time 4/4
  \showStartRepeatBar \bar "[|:"
  \once \override Score.RehearsalMark.break-align-symbols = #'(clef)
  \mark \markup \bold \box Latin    
  \new Voice = "melody" {
    \repeat volta 2 { 
      c1 ~ | c ~ | c4 des c g | bes c e g, \break
      bes1 ~ | bes ~ | bes4 c des c des c b e, \break
      bes'1 ~ | bes ~ | bes4 c ces bes | a as ges e \break
      << { \voiceOne f1 ~ | f1 ~ | f1 ~ | f1 | }
         \new Voice { \voiceTwo r2 \times 2/3 { es4 d es } | d2 c4 d 
                      \times 2/3 { es4 d es } d2 ~ | d1  } >>
    }
    \break \mark \markup \bold \box Swing
    f'1 | d2 c4. g8 ~ | g1 ~ | g4. f8 e4-. f-. |  \break
    c'1 | g2 f4. c8 ~ | c1 | r2 bes'8 c des d \break
    es1 | c2 bes4. f8 ~ | f1 ~ | f2 g4-. es-.  \break
    c'4. as8 ~ as2 ~ | as bes4-. as-. | g2 g4. g8 ~ | g2 r
    \break \bar "||" \mark \markup \bold \box Latin
    c1 ~ | c ~ | c4 des c g | bes c e g, \break
    bes1 ~ | bes ~ | bes4 c des c des c b e, \break
    bes'1 ~ | bes ~ | bes4 c ces bes | a as ges e \break
    << { \voiceOne f1 ~ | f1 ~ | f1 ~ | f1 | }
       \new Voice { \voiceTwo r2 \times 2/3 { es4 d es } | d2 c4 d 
                    \times 2/3 { es4 d es } d2 ~ | d1  } >>
} }

theNotesV =  \relative c'' {
  \clef "treble" \key f \minor \time 4/4
  \showStartRepeatBar \bar "[|:"
  \once \override Score.RehearsalMark.break-align-symbols = #'(clef)
  \mark \markup \bold \box Latin    
  \new Voice = "melody" {
    \repeat volta 2 { 
      c1 ~ | c ~ | c4 des c g | bes c e g, \break
      bes1 ~ | bes ~ | bes4 c des c des c b e, \break
      bes'1 ~ | bes ~ | bes4 c ces bes | a as ges e  \break
      f1 ~ | f1 ~ | f1 ~ | f1 | 
    }
    \break \mark \markup \bold \box Swing
    f'1~ | 4 ges f c | es1 | des | \break 
    f1 ~ |  4 g! f c | es1 | d | \break
    es1~ | 4 f es c | bes1 | f'2 e \break
    es2. f,4~ | f g as bes | c1~ | 2 2
    \break \bar "||" \mark \markup \bold \box Latin
    c1 ~ | c ~ | c4 des c g | bes c e g, \break
    bes1 ~ | bes ~ | bes4 c des c des c b e, \break
    bes'1 ~ | bes ~ | bes4 c ces bes | a as ges e  \break
   f1 ~ | f1 ~ | f1 ~ | f1 | 
} }

theNotesT =  \relative c'' {
  \clef "treble" \key f \minor \time 4/4
  \showStartRepeatBar \bar "[|:"
  \once \override Score.RehearsalMark.break-align-symbols = #'(clef)
  \mark \markup \bold \box Latin    \repeat volta 2 { 
    c1 ~ | c ~ | c4 des c g | bes c e g,
    bes1 ~ | bes ~ | bes4 c des c des c b e, \break
    bes'1 ~ | bes ~ | bes4 c ces bes | a as ges e 
    << { f1 ~ | f1 ~ | f1 ~ | f1 | } \\
       { r2 \times 2/3 { es4 d es } | d2 c4 d 
         \times 2/3 { es4 d es } d2 ~ | d1  } >>
  }
  \break 
  \doubleMark
  \markup \with-color #red fine
  \markup \bold \box Swing
  f'1 | d2 c4. g8 ~ | g1 ~ | g4. f8 e4-. f-. | 
  c'1 | g2 f4. c8 ~ | c1 | r2 bes'8 c des d \break
  es1 | c2 bes4. f8 ~ | f1 ~ | f2 g4-. es-.
  c'4. as8 ~ as2 ~ | as bes4-. as-. | g2 g4. g8 ~ | g2 r
  \once \override Score.RehearsalMark #'direction = #DOWN
  \once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
  \mark \markup \with-color #red "D.C. al fine"
  \bar "||"
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
  c1:9- \parenthesize des:8 \repeat percent 2 c1:9- \break
  c1:9- \parenthesize des:8 \repeat percent 2 c1:9- \break
  c1:9- \parenthesize des:8 \repeat percent 2 c1:9- \break
  f:m7 f:m6 f:m7 f:m6 \bar ":|]" \break
  \repeat percent 4 f:9 \break
  \repeat percent 4 bes:9 \break
  \repeat percent 4 es:7 \break
  \repeat percent 2 as:6 \repeat percent 2 c:7 \break
  c1:9- \parenthesize des:8 \repeat percent 2 c1:9- \break
  c1:9- \parenthesize des:8 \repeat percent 2 c1:9- \break
  c1:9- \parenthesize des:8 \repeat percent 2 c1:9- \break
  f:m7 f:m6 f:m7 f:m6 
  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #5 Latin s1*15 
  s1 ^\markup \bold \box \fontsize #5 Swing s1*15 
  s1 ^\markup \bold \box \fontsize #5 Latin
}

verse = \lyricmode {
  Night and stars a -- bove that shine so bright __
  The myst' -- ry of their fa -- ding light __
  That shines u -- pon our ca -- ra -- van __


  This is so ex -- ci -- ting, __ you are so in -- vi -- ting __
  Res -- ting in my arms __
  As I thrill to the ma -- gic charms __

  Of you be -- side me here, be -- neath the blue __
  My dream of love is co -- ming true __ 
  With -- in our de -- sert ca -- ra -- van __
}

verseB = \lyricmode {
  Sleep u -- pon my shoul -- der as we creep __
  A -- cross the sand so I may keep __
  This mem' -- ry of our ca -- ra -- van __

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
        \new ChordNames { \hsupT }
        \new ChordNames { \harmoniesT }
        \new Staff \with { instrumentName = \CleSol } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotesT
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
        \new ChordNames { \transpose c d \hsupT }
        \new ChordNames { \transpose c d \harmoniesT } 
        \new Staff \with { instrumentName = \Bb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotesT
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
        \new ChordNames { \transpose c a \hsupT }
        \new ChordNames { \transpose c a \harmoniesT }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c a \theNotesT
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
        \new ChordNames { \hsup }
        \new ChordNames { \harmonies }
        \new Staff \with { instrumentName = \CleSol } 
        <<
          %\new Voice \with { \consists "Pitch_squash_engraver" } 
          \theNotes
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
        \new ChordNames { \transpose c d \hsup }
        \new ChordNames { \transpose c d \harmonies } 
        \new Staff \with { instrumentName = \Bb  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }  
          \transpose c d \theNotes
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
        \new ChordNames { \transpose c a \hsup }
        \new ChordNames { \transpose c a \harmonies }
        \new Staff \with { instrumentName = \Eb } <<
          %\new Voice  
          \transpose c a \theNotes
          %           \addlyrics \verse
          %           \addlyrics \verseB
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

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Vocala4") 
  \bookpart {
    \score {
      <<
         \new ChordNames { \harmoniesV } 
        \new Staff \with { instrumentName = \CleSol  } <<
          % \new Voice \with { \consists "Pitch_squash_engraver" }  
          \theNotesV
        >> 
        \new Lyrics \lyricsto "melody" \verse
        \new Lyrics \lyricsto "melody" \verseB
      >>
    } %\form
  } 
}

%{
convert-ly (GNU LilyPond) 2.22.1  convert-ly: Traitement de «  »...
Conversion en cours : 2.20.0, 2.21.0, 2.21.2, 2.22.0
%}
