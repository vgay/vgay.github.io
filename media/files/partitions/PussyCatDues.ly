
\version "2.22.0"
#(set-global-staff-size 16)
\include "AdditionalFunctions.ly"
\include "VariablesJazz.ly"
\include "jazzchords.ily"
\include "lilyjazz.ily"



\paper {
  indent = 0\mm
  ragged-last-bottom = ##t
  ragged-bottom = ##t
  ragged-last = ##f
  markup-system-spacing = #'((basic-distance . 12)
                             (minimum-distance . 8)
                             (padding . 1))
  score-system-spacing = #'((basic-distance . 12)
                            (minimum-distance . 8)
                            (padding . 2))
}

title = #"Pussy Cat Dues"
composer = #"Charles Mingus"
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
  asplayed = #"Charles Mingus" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=naeMRd3qmTA"
  arranger = \markup \on-the-fly #played?
  \with-url #url
  \with-color #blue \underline
  \concat { "(as played by " \fromproperty #'header:asplayed ")" }
  tagline = ##f
}

\layout {
  \context {
    \Score
    voltaSpannerDuration = #(ly:make-moment 4 4)
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


harmonies = \chordmode {
  d2:7 bes:7 d:7 bes:7 d:7 bes:7 d1:7 
  g:7 c:7 d2:7 bes:7 d2:7 e:7/gis 
  e:m5-7 a:9+ f:m7 bes:7 es as:7 es1:7
}
grilleH = \chordmode { es4:9 d:9 des:9 c:9 b:9 bes:9 a:9 as:9 es:9 d:9 des:9 c:9 b:9 bes:9 a2:5+9
}
Piano =  \relative c {
  \set Staff.instrumentName = "Piano"
  \clef "treble" \key c \major \time 4/4
  \partial 8 r8
  r8 <fis c' f>4. r8 <g cis fis>4. |
  r8 <fis c' f>4. r8 <g cis fis>4. |
  r8 <fis c' f>4. r8 <g cis fis>4. |
  \tuplet 3/2 { r8 <fis c' f> r } \tuplet 3/2 { <g cis fis> r <fis c' f> } \tuplet 3/2 { r <g cis fis> r } \tuplet 3/2 { <fis c' f> r <g cis fis> }
}
Basse  =  \relative c' {
  \set Staff.instrumentName = "Basse"
  \clef "bass" \key c \major \time 4/4
  \partial 8 a8
  d,4. a'8 d,4. a8 | d4. a'8 d,4. a8 | d4. a'8 d,4. a8 |
  \tuplet 3/2 { d a' d, } \tuplet 3/2 { a' d, a' } \tuplet 3/2 { d, a' d, } \tuplet 3/2 { a' d, a' }
}
IntroTenor  =  \relative c' {
  \clef "treble_8" \key c \major \time 4/4 
  \mark \markup \bold \box "Intro"
  \partial 8 r8
  r8 c4 f8 d2 | r8 c4 f8 d2 | r8 c4 f8 d2 | r8 c4 f8 d2 | 
}
IntroTromb  =  \relative c {
  \clef "treble_8" \key c \major \time 4/4   
  \partial 8 r8
  r8 fis4 g8 as as4. | r8 fis4 g8 as2 | r8 fis4 g8 as as4. | r8 fis4 g8 as2 \noPageBreak |
}

Theme =  \relative c' {
  \set Staff.instrumentName = "Clarinette"
  \set Staff.shortInstrumentName = "Cl."
  \clef "treble" \key c \major \time 4/4
  \mark \markup \bold \box "Theme"
  \repeat volta 2 {
    r8 f \tuplet 3/2 { fis a b } c c4 bes8 |
    a8 f8 \tuplet 3/2 { fis8 a b } c4. bes8 |
    a8 f8 \tuplet 3/2 { fis8 a b } c bes \tuplet 3/2 { a g a~ }
    a2. r8 d, | \break
    f g f4-. f-. f-. | e8 g e4-. e2 | 
    r8 f \tuplet 3/2 { fis a b } c c4 bes8 |
    \tuplet 3/2 { a4 f8 } \tuplet 3/2 { fis8 a b } cis16 e cis8~ cis fis, \break
    g16 fis g fis g fis g fis g a r4 g8 | 
    as16 g as g as g as g as bes r8 \tuplet 3/2 { r as bes } |
    g8 es~ \tuplet 3/2 { es g bes } as4~ \tuplet 3/2 { as8 c es } | es1         
  }
}

Tenor =  \relative c' {
  \set Staff.instrumentName = "Sax Tenor"
  \set Staff.shortInstrumentName = "ST"
  \clef "treble_8" \key c \major \time 4/4   
  r8 c4 f8 d8 d4 bes8 | a8 c4 f8 d4. bes8 |
  a8 c4 f8 d bes \tuplet 3/2 { a8 g c~ } | c2. r4
  d8 f \tuplet 3/2 { d e b } d4 r16 f d b  | bes4 \tuplet 3/2 { f'8 d bes } d2 |
  r8 c4 f8 d8 d4 bes8 | a8 c4 f8 d4. fis,8
  g16 fis g fis g fis g fis g a r4 g8 | as16 g as g as g as g as bes r8 \tuplet 3/2 { r as bes } |
  g8 es~ \tuplet 3/2 { es g bes } as4~ \tuplet 3/2 { as8 c \once \override TextScript #'extra-offset = #'( 4 . 0 )  es ^\markup \bold "Solo" } |
  \comp #4
  %\tuplet 3/2 { es' des bes } \acciaccatura { as8 bes} as4  \tuplet 3/2 { as!16 bes! as ges es des } f4
  
}

Tromb =  \relative c' {
  \set Staff.instrumentName = "Trb 1st x"
  \set Staff.shortInstrumentName = "Tr1"
  \clef "treble_8" \key c \major \time 4/4   
  r8 fis,4 g8 as8 as4 e8 |
  fis8 fis4 g8 as4. e8 |
  r8 fis4 g8 as8 as4 r8 |
  fis'8 f d16 a as g \tuplet 3/2 { fis8 a fis } d c
  
  a2 r8 a' \acciaccatura b16 d16 e f g | a2~a8 \tuplet 3/2 { g16 a g } f16 e d bes 
  a g fis4 g8 as8 as4 e8
  fis8-. fis4 g8 as16 bes as4.
  bes16 a bes a bes a bes a bes c r4. | c16 b c b c b c b c d r8 \tuplet 3/2 { r c d } |
  bes8 g~ \tuplet 3/2 { g8 es f } ges4. r8 |
  ges'4. ges16 f \tuplet 3/2 { c8 ces bes } as g
}
TrombTwo =  \relative c' {
  \set Staff.instrumentName = "Trb 2nd x"
  \set Staff.shortInstrumentName = "Tr2"
  \clef "treble_8" \key c \major \time 4/4   
  r8 fis,4 g8 as8 as4 e8 |
  fis8 fis4 g8 as4 fis'16 f es bes |
  a4 fis4 g8 as4 r8 |
  r16 ges' g as a es f ges     g a, b c d a g f
  
  d2  \scoop f'8  g16 f~ f d8 bes16 | a16 as8.~ as4 \tuplet 3/2 { r8 bes' a } as16 g f es  
  a4 r8 fis,16 g as8 as4 e8
  fis8-. fis4 g8 as16 bes as4.
  bes16 a bes a bes a bes a bes c r4. | c16 b c b c b c b c d r8 \tuplet 3/2 { r c d } |
  bes8 g~ \tuplet 3/2 { g8 es f } ges4. r8 |
  R1
}
TrombThree =  \relative c' {
  \set Staff.instrumentName = "Trombone"
  \set Staff.shortInstrumentName = "Tr."
  \clef "treble_8" \key c \major \time 4/4   
  r8 fis,4 g8 as8 as4 e8 |
  fis8 fis4 g8 as4. e8 |
  fis8 fis4 g8 as4. \once \override TextScript #'extra-offset = #'( 6 . 0 )  r8 ^\markup \bold "Solo"|
  \comp #4  \comp #4 \comp #4
  fis4. g8 as8 as4 e8
  fis8-. fis4 g8 as16 bes as4.
  bes16 a bes a bes a bes a bes c r4. | c16 b c b c b c b c d r8 \tuplet 3/2 { r c d } |
  bes8 g~ \tuplet 3/2 { g8 es f } ges4. \once \override TextScript #'extra-offset = #'( 6 . 0 )  r8 ^\markup \bold "Solo" |
  \comp #4
  \pageBreak
}

TrombGenerique =  \relative c' {
  \set Staff.instrumentName = "Tromb last x"
  \set Staff.shortInstrumentName = "Tr3"
  \clef "treble_8" \key c \major \time 4/4   
  r8 fis,4 g8 as8 as4 e8 |
  fis8 fis4 g8 as4. e8 |
  fis8 fis4 g8 as4. r8 |
  r8 d f16 fis g gis c4 a8. g16
  
  f d4.. f8 e16 f e d c bes| a8 g a4 r4 \tuplet 3/2 { a8 as g } 
  fis4. g8 as8 as4 e8
  fis8-. fis4 g8 as16 bes as4.
  bes16 a bes a bes a bes a bes c r4. | c16 b c b c b c b c d r8 \tuplet 3/2 { r c d } |
  bes8 g~ \tuplet 3/2 { g8 es f } ges4. r8 |
  \tuplet 3/2 { bes8 c es } fis16 f es c \tuplet 3/2 { bes8 fis f } es4 \fermata
  %\pageBreak
}


Riffs  =  \relative c' {
  \override Staff.InstrumentName.self-alignment-X = #CENTER
  \clef "treble" \key es \major \time 4/4 
  \mark \markup \bold \box "1"
  r8 \tuplet 3/2 { es ges es } ges es4-- c-. | r8 \tuplet 3/2 { es ges es } ges es4-- g \bendAfter #3 \bar "||"
  \mark \markup \bold \box "2"
  es2 r8 es \tuplet 3/2 { es ges es } \bar "||"
  \mark \markup \bold \box "3" 
  r8 << { ges?8 ges es ges4 es } \\ { es8 es c f4 c } >> \bar "||"
  \mark \markup \bold \box "4" 
  r4 \tuplet 3/2 { es8 c es } \tuplet 3/2 { ges?4 es8 \bendAfter #-3 } r4
  \bar ".."
}
grille  =  \relative c'' {
  \improvisationOn
  \repeat unfold 3 { b4 b b b } b b b2
}



% The score definition
\book {  
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  \header { meter = \markup \pad-around #1 \with-color #red \bold "partition sur 2 pages" }

  \bookpart {
    #(define output-suffix "CTab")

    %     \markuplist {
    %       \wordwrap-lines \large { "  " }
    %     }
    
    \score {
      \layout { ragged-last = ##f }
      <<
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol } <<
            \partCombine \IntroTenor \IntroTromb
          >>
          \new Staff <<
            \Piano
          >>
          \new Staff <<
            \Basse
          >>
        >>
      >>    
    }    
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \harmonies
        }
        
        \new StaffGroup <<
          \new Staff <<
            \Theme
          >>
          \new Staff <<
            \Tenor
          >>
          \new Staff <<
            \TrombThree
          >>
        >>
      >>      
    }
    \markuplist {
      \wordwrap-lines \large { "  " }
      \wordwrap-lines \large {
        Chorus sur la grille de Mi\flat blues dont les 4 premières mesures de chaque solos sont altérées par la rytmique selon la progression suivante :
      }
    }
    \score {
      \layout { indent = #0 }
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \grilleH
        }
        \new Staff <<
          \grille
        >>
      >>
    }
    \markuplist {
      \wordwrap-lines \large { "  " }
      \wordwrap-lines \large { Les riffs suivants sont répétés sur tout le 2ème chorus de chaque solos. 
                               \bold { Riffs 3 et 4 : } altérer ou non le Sol (\flat) en fonction des besoins
      }
    }
    \score {
      \layout { indent = #0 }
      <<
        \new Staff <<
          \Riffs 
        >>
      >>
    }
  }
}

\book {  
  \header { meter = \markup \pad-around #1 \with-color #red \bold "partition sur 2 pages" }
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  \bookpart {
    #(define output-suffix "BbTab")
    \score {
      \layout { ragged-last = ##f }
      <<
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Bb } <<
             \transpose c d { \partCombine \IntroTenor \IntroTromb }
          >>
          \new Staff <<
            \Piano
          >>
          \new Staff <<
            \Basse
          >>
        >>
      >>    
    }    
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
           \transpose c d \harmonies
        }
        
        \new StaffGroup <<
          \new Staff <<
             \transpose c d \Theme
          >>
          \new Staff <<
             \transpose c d \Tenor
          >>
          \new Staff <<
             \transpose c d \TrombThree
          >>
        >>
      >>      
    }
    \markuplist {
      \wordwrap-lines \large { "  " }
      \wordwrap-lines \large {
        Chorus sur la grille de Fa blues dont les 4 premières mesures de chaque solos sont altérées par la rytmique selon la progression suivante :
      }
    }
    \score {
      \layout { indent = #0 }
      <<
        \new ChordNames {
          \set chordChanges = ##f
           \transpose c d \grilleH
        }
        \new Staff <<
         \transpose c d \grille
        >>
      >>
    }
    \markuplist {
      \wordwrap-lines \large { "  " }
      \wordwrap-lines \large { Les riffs suivants sont répétés sur tout le 2ème chorus de chaque solos. 
                               \bold { Riffs 3 et 4 : } altérer ou non le la (\flat) en fonction des besoins
      }
    }
    \score {
      \layout { indent = #0 }
      <<
        \new Staff <<
          \transpose c d \Riffs 
        >>
      >>
    }
  }
}


\book {  
  \header { meter = \markup \pad-around #1 \with-color #red \bold "partition sur 2 pages" }
  \paper {
    #(set-paper-size "tablette")
    page-count = #2
  }
  \bookpart {
    #(define output-suffix "EbTab")
    \score {
      \layout { ragged-last = ##f }
      <<
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Eb } <<
             \transpose c a { \partCombine \IntroTenor \IntroTromb }
          >>
          \new Staff <<
            \Piano
          >>
          \new Staff <<
            \Basse
          >>
        >>
      >>    
    }    
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
           \transpose c a \harmonies
        }
        
        \new StaffGroup <<
          \new Staff <<
             \transpose c a \Theme
          >>
          \new Staff <<
             \transpose c a \Tenor
          >>
          \new Staff <<
             \transpose c a \TrombThree
          >>
        >>
      >>      
    }
    \markuplist {
      \wordwrap-lines \large { "  " }
      \wordwrap-lines \large {
        Chorus sur la grille de Do blues dont les 4 premières mesures de chaque solos sont altérées par la rytmique selon la progression suivante :
      }
    }
    \score {
      \layout { indent = #0 }
      <<
        \new ChordNames {
          \set chordChanges = ##f
           \transpose c a \grilleH
        }
        \new Staff <<
         \transpose c a \grille
        >>
      >>
    }
    \markuplist {
      \wordwrap-lines \large { "  " }
      \wordwrap-lines \large { Les riffs suivants sont répétés sur tout le 2ème chorus de chaque solos. 
                               \bold { Riffs 3 et 4 : } altérer ou non le mi (\flat) en fonction des besoins
      }
    }
    \score {
      \layout { indent = #0 }
      <<
        \new Staff <<
          \transpose c a \Riffs 
        >>
      >>
    }
  }
}

\book {  
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  \bookpart {
    #(define output-suffix "Ca4")
    \score {
      \layout { ragged-last = ##f }
      <<
        \new StaffGroup <<
          \new Staff \with { instrumentName = \CleSol } <<
            \partCombine \IntroTenor \IntroTromb
          >>
          \new Staff <<
            \Piano
          >>
          \new Staff <<
            \Basse
          >>
        >>
      >>    
    }    
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \harmonies
        }
        
        \new StaffGroup <<
          \new Staff <<
            \Theme
          >>
          \new Staff <<
            \Tenor
          >>
          \new Staff <<
            \TrombThree
          >>
        >>
      >>      
    }
    \markuplist {
      \wordwrap-lines \large { "  " }
      \wordwrap-lines \large {
        Chorus sur la grille de Mi\flat blues dont les 4 premières mesures de chaque solos sont altérées par la rytmique selon la progression suivante :
      }
    }
    \score {
      \layout { indent = #0 }
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \grilleH
        }
        \new Staff <<
          \grille
        >>
      >>
    }
    \markuplist {
      \wordwrap-lines \large { "  " }
      \wordwrap-lines \large { Les riffs suivants sont répétés sur tout le 2ème chorus de chaque solos. 
                               \bold { Riffs 3 et 4 : } altérer ou non le Sol (\flat) en fonction des besoins
      }
    }
    \score {
      \layout { indent = #0 }
      <<
        \new Staff <<
          \Riffs 
        >>
      >>
    }
  }
}

\book {  
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  \bookpart {
    #(define output-suffix "Bba4")
    \score {
      \layout { ragged-last = ##f }
      <<
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Bb } <<
             \transpose c d { \partCombine \IntroTenor \IntroTromb }
          >>
          \new Staff <<
            \Piano
          >>
          \new Staff <<
            \Basse
          >>
        >>
      >>    
    }    
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
           \transpose c d \harmonies
        }
        
        \new StaffGroup <<
          \new Staff <<
             \transpose c d \Theme
          >>
          \new Staff <<
             \transpose c d \Tenor
          >>
          \new Staff <<
             \transpose c d \TrombThree
          >>
        >>
      >>      
    }
    \markuplist {
      \wordwrap-lines \large { "  " }
      \wordwrap-lines \large {
        Chorus sur la grille de Fa blues dont les 4 premières mesures de chaque solos sont altérées par la rytmique selon la progression suivante :
      }
    }
    \score {
      \layout { indent = #0 }
      <<
        \new ChordNames {
          \set chordChanges = ##f
           \transpose c d \grilleH
        }
        \new Staff <<
         \transpose c d \grille
        >>
      >>
    }
    \markuplist {
      \wordwrap-lines \large { "  " }
      \wordwrap-lines \large { Les riffs suivants sont répétés sur tout le 2ème chorus de chaque solos. 
                               \bold { Riffs 3 et 4 : } altérer ou non le la (\flat) en fonction des besoins
      }
    }
    \score {
      \layout { indent = #0 }
      <<
        \new Staff <<
          \transpose c d \Riffs 
        >>
      >>
    }
  }
}

\book {  
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  \bookpart {
    #(define output-suffix "Eba4")
    \score {
      \layout { ragged-last = ##f }
      <<
        \new StaffGroup <<
          \new Staff \with { instrumentName = \Eb } <<
             \transpose c a { \partCombine \IntroTenor \IntroTromb }
          >>
          \new Staff <<
            \Piano
          >>
          \new Staff <<
            \Basse
          >>
        >>
      >>    
    }    
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
           \transpose c a \harmonies
        }
        
        \new StaffGroup <<
          \new Staff <<
             \transpose c a \Theme
          >>
          \new Staff <<
             \transpose c a \Tenor
          >>
          \new Staff <<
             \transpose c a \TrombThree
          >>
        >>
      >>      
    }
    \markuplist {
      \wordwrap-lines \large { "  " }
      \wordwrap-lines \large {
        Chorus sur la grille de Do blues dont les 4 premières mesures de chaque solos sont altérées par la rytmique selon la progression suivante :
      }
    }
    \score {
      \layout { indent = #0 }
      <<
        \new ChordNames {
          \set chordChanges = ##f
           \transpose c a \grilleH
        }
        \new Staff <<
         \transpose c a \grille
        >>
      >>
    }
    \markuplist {
      \wordwrap-lines \large { "  " }
      \wordwrap-lines \large { Les riffs suivants sont répétés sur tout le 2ème chorus de chaque solos. 
                               \bold { Riffs 3 et 4 : } altérer ou non le mi (\flat) en fonction des besoins
      }
    }
    \score {
      \layout { indent = #0 }
      <<
        \new Staff <<
          \transpose c a \Riffs 
        >>
      >>
    }
  }
}

%{
convert-ly (GNU LilyPond) 2.22.1  convert-ly: Traitement de «  »...
Conversion en cours : 2.20.0, 2.21.0, 2.21.2, 2.22.0
%}
