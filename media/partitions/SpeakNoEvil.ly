
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

title = #"Speak No Evil"
composer = #"Wayne Shorter"
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
  asplayed = #"Wayne Shorter" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=fvRkGglLe-U"
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
  s4. c1:m11 des:7+ c1:m11 des:7+ c1:m11 des:7+ c1:m11 des2:7+ es4.:m11 e8:m11 
  e2:m11 c4.:m11 d8:m11 s2 bes4.:m11 
  a8:8 a1:8 bes:m11 a1:7.5+9-11+ bes:m11 bes:m11
  a:m5-7 as:7 g:m7 ges:13 f:m7 bes:7 es:7+9+11+ des:7+11+
  c1:m11 des:7+ c1:m11 des:7+ c1:m11 des:7+ c1:m11 des2:7+ es4.:m11 e8:m11 
  e2:m11 c4.:m11 d8:m11 s2 bes4.:m11 
  a8:8 a1:8 bes:m11 a1:7.5+9-11+ bes:m11
}


theNotes =  \relative c'' {
  \clef "treble" \key es \major \time 4/4
  \partial 4. g8 c c,
  \repeat volta 2 {
    \A
    f1 ~ f ~ f ~ f2 r8 g8 c c, \break
    f1 ~ f ~ f ~ f2
    << {  as4. a8 ~ \bar "||" \break| a4 fis8 a f4 d8 g ~ | g4 e8 g es4 c8 es8 ~ | es1 | es1 ~ | es1 ~ }
       \\ { f4. fis8 ~ | fis4 d8 fis d4 bes8 e ~ | e4 c8 e c4 as8 g ~ | g1 | as2.. g8 ~ | g1 }
    >>
  }
  \set Score.repeatCommands = #'( (volta "1.") )
  {<< { es'2 r8 g8 c c, } \\ { as2 s } >> } 
  \set Score.repeatCommands = #'((volta #f) (volta "2.") end-repeat)
  {<< { es'2 \repeatTie r2 } \\ { as,2 r2 } >> }
  \set Score.repeatCommands = #'((volta #f))
  \bar "||" \break \B
  es'8 c f4-. r8 f c ges'-. | r4. ges8 c, as'-. r4 | a8 c, bes'4-. r8 bes c, c'-. | 
  r4. c8 es, es'-. r4 | \break d8 as es'4-. r8 es8 as, e'-. | r4. e8 b as'-. r4
  << { a4. a8 } \\ { fis,4. fis8 } >> r2 | r2 r8 g8 c c, \bar "||" 
  \break
  \A
  f1 ~ f ~ f ~ f2 r8 g8 c c, \break
  f1 ~ f ~ f ~ f2
  << {  as4. a8 ~ \bar "||" \break| a4 fis8 a f4 d8 g ~ | g4 e8 g es4 c8 es8 ~ | es1 | es1 ~ | es1 ~ | es2 r2 }
     \\ { f4. fis8 ~ | fis4 d8 fis d4 bes8 e ~ | e4 c8 e c4 as8 g ~ | g1 | as2.. g8 ~ | g1 | as2 r2 }
  >>
  \bar ".."
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
 c1:m11 des:7+ c1:m11 des:7+ \break
 c1:m11 des:7+ c1:m11 \/des2:7+ es:m11 \break
 \/e2:m11 c:m11 \/ d:m11 bes:m11 as1:8 \break
 bes:m11 as:8 bes:m11 \break \bar ":|]"
 a:m5-7 as:7 g:m7 ges:13 \break
 f:m7 bes:7 es:7+9+11+ des:7+11+
 c1:m11 des:7+ c1:m11 des:7+ \break
 c1:m11 des:7+ c1:m11 \/des2:7+ es:m11 \break
 \/e2:m11 c:m11 \/ d:m11 bes:m11 as1:8 \break
 bes:m11 as:8 bes:m11  \bar ".." }

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*13 
  s1 ^\markup \bold \box \fontsize #7 B s1*7 
  s1 ^\markup \bold \box \fontsize #7 A
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
    } %\form
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
    } %\form
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