
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
  markup-system-spacing = #'((basic-distance . 23)
                             (minimum-distance . 8)
                             (padding . 1))
}

title = #"Dans mon jardin d'hiver"
composer = #"Benjamin Biolay"
meter = #"(Med. Bossa)"
kwtempo = #"Medium"
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
    \ChordNames
    \override ParenthesesItem.font-size = #2
}}


\layout {
  \context {
    \Score
    extraNatural = ##f
    \omit BarNumber
    skipBars = ##t
  }
  \context {
    \ChordNames
    \override ParenthesesItem.font-size = #2
  }
}

harmonies = \chordmode {
  \set chordChanges = ##t
 s2. e1:m5-7 a:9- d:m7 d:m7 
  e1:m5-7 a:9- d:m7 d:m7 d:m7
  g:m7 c:9 f:7+ f:7+ e:m5-7 a:9- d:m7 d:m7
  g:m7 c:9 f:7+ f:7+ e:m5-7 a:9- d:m7 d:m7
  e1:m5-7 a:9- d:m7 d:m7 
  e1:m5-7 a:9- d:m7
}


theNotes =  \relative c' {
  \clef "treble" \key f \major \time 4/4
  \partial 2. f8 g8 a4. f8 
  \repeat volta 2 { 
    \A
    g8 bes4 e,8 ~ e2 | % 2
    r4 e8 f g4.  e8 | % 3
    f8 a4 d,8 ~ d2 | % 4
    r4 f8 g8 a4. f8 |  \break % 5
    g8 bes4 e,8 ~ e2 ~ | % 6
    e4 r8 e8 g8 f8 e8 f8 | % 7
    d1
  }
  \alternative {
    { r4 f8 g8 a4. f8 }
    { r4  d4 d'4. d8 \bar "||" }
  } \break
  \B
  d1 | % 11
  r4 d4 c4 bes4 | % 12
  bes4. a8 a2 ~ | % 13
  a4. r8 r4 a4 |  % 14
  bes4. a8 a2 | % 15
  r8 a a bes8 a8 f g a~ | % 16
  a1 | % 17
  r4 d,4 d'4. d8 \break
  d1 | % 19
  r4 d4 c4 bes4 | 
  bes4. a8 a2 ~ | % 21
  a4. r8 bes4. a8 |  % 22
  e1 | % 23
  bes'4. a8 d,2 ~ | % 24
  d2. r4 | % 25
  r4 f8 g8 a4. f8  \break \bar  "||-[|:"
    \A    
    \repeat volta 2 { 
    g8 bes4 e,8 ~ e2 | % 2
    r4 e8 f g4.  e8 | % 3
    f8 a4 d,8 ~ d2 | % 4
    r4 f8 g8 a4. f8 |  \break % 5
    g8 bes4 e,8 ~ e2 ~ | % 6
    e4 r8 e8 g8 f8 e8 f8 | % 7
    d1 }
  \alternative {
    { r4 f8 g8 a4. f8 }
    { R1 }
  }  \bar ".."
}

grille = \chordmode {
  \bar "[|:"
  e1:m5-7 a:9- \repeat percent 2 d:m7 \break
  e1:m5-7 a:9- \repeat percent 2 d:m7 \break \bar ":|][|:"
  g:m7 c:9 \repeat percent 2 f:7+ \break
e1:m5-7 a:9- \repeat percent 2 d:m7
  \bar ":|]" }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*7 
  s1 ^\markup \bold \box \fontsize #7 B 
}

verse = \lyricmode {
  Je vou -- drais du so -- leil vert
Des den -- telles et des théi -- ères
Des pho -- tos de bord de mer
Dans mon jar -- din d'hi -- ver

Je voud -- rais de

\repeat unfold 3 { \skip 1 }
fleur 
Sous la pluie de no -- vembre
Mes mains qui courent
Je n'en peux plus de t'at -- tendre
Les an -- nées passent
Qu'il est loin l'â -- ge tendre
Nul ne peut nous en -- tendre

Je vou -- drais du Fred As -- taire
Re -- voir un La -- té -- co -- ère
Je vou -- drais tou -- jours te plaire
Dans mon jar -- din d'hi -- ver
% 
Je veux dé -- jeu
% Comme au long des golfes clairs
% T'embrasser les yeux ouverts
% Dans mon jardin d'hiver
}

verseB = \lyricmode {
  \repeat unfold 4 { \skip 1 }
 la lu -- mière
Comme en Nou -- velle An -- gle -- terre
Je veux chan -- ger "d'at" -- mos __ phère
Dans mon jar -- din d'hi -- ver
\repeat unfold 4 { \skip 1 }
Ta robe à 
\repeat unfold 38 { \skip 1 }




ner par terre
Comme au long des gol -- fes clairs
T'em -- bras -- ser les yeux ou -- verts
Dans mon jar -- din d'hi -- ver
}

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "CTab")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##t
          \harmonies
        }
        \new Staff \with { instrumentName = \CleSol \consists "Merge_rests_engraver" } <<
            \new Voice \with { \consists "Pitch_squash_engraver" } \theNotes
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "BbTab") 
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c d \harmonies
        } 
        \new Staff \with { instrumentName = \Bb \consists "Merge_rests_engraver" } <<
            \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c d \theNotes
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "tablette")
    page-count = #1
  }
  #(define output-suffix "EbTab")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c a \harmonies
        }
        \new Staff \with { instrumentName = \Eb \consists "Merge_rests_engraver" } <<
            \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c a \theNotes
      >> >>
} } }

\book {
  \paper {
    #(set-paper-size "a4")
    page-count = #1
  }
  #(define output-suffix "Ca4")
  \bookpart {
    \score {
      <<
        \new ChordNames {
          \set chordChanges = ##t
          \harmonies
        }
        \new Staff \with { instrumentName = \CleSol \consists "Merge_rests_engraver" } 
        <<
          \new Voice \with { \consists "Pitch_squash_engraver" } \theNotes
          \addlyrics \verse
          \addlyrics \verseB
      >> >>
    } 
    
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
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
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c d \harmonies
        } 
        \new Staff \with { instrumentName = \Bb \consists "Merge_rests_engraver" } <<
            \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c d \theNotes
      >> >>

  }
    \markup \pad-markup #2 " "
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
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
        \new ChordNames {
          \set chordChanges = ##f
          \transpose c a \harmonies
        }
        \new Staff \with { instrumentName = \Eb \consists "Merge_rests_engraver" } <<
            \new Voice  \transpose c a \theNotes
      >> >>
  }   
  \markup \pad-markup #2 " "
    \score {
      \layout {
        indent = 0
        ragged-right = ##f
        ragged-last = ##f
        \context {
          \Score
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
        }
        \transpose c a \grille
      >>
} } }