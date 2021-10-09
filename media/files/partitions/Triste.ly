
\version "2.22.0"
\version "2.22.0"
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

title = #"Triste"
composer = #"Tom Jobim"
meter = #"(Bossa)"
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
  asplayed = #"Elis Regina and Tom Jobim" % doit être commentée si vide
  url = #"https://www.youtube.com/watch?v=xWljdjvGbxQ"
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
  bes1:7+ s ges:7+ b:11+ bes:7+ es:11+ d:m7 g:7
  c:m7 a2:m7 d:9+ g1:m7 e2:m7 a:7 d1:7+ e2:m7 a:7 d:m7 g:7 c:m7 f:7
  bes1:7+ s bes:m7 s bes:7+ s f:m7 bes:7 es:7+ as:11+ d2:m7 g:m7 c1:7
  c:m7 f:7 bes2:m7 es:7 bes2:m7 es:7 bes2:m7 es:7 bes2:m7 es:7
}


theNotes =  \relative c'' 
{
  \clef "treble" \key bes \major \time 4/4
  \A r4 r8 bes~ bes a4 bes8 | a4 g8 d~ d es4 f8~ | f1~ | f1 
  r4 r8 bes~ bes a4 bes8 | a4 g8 d~ d es4 f8~ | f1~ | f1 \break
  r4 r8 g f g4 f8~ | f es4 d8~ d a4 c8~ | c a bes d f a4 c8~ | c2~ c8 bes4 cis8~  \break
  cis a a a~ a2 | a8 fis fis fis~ fis4. e8~ | e d d d~ d4 g~ | g8 f f f~ f2 \bar "||" \break
  \B r4 r8 bes~ bes a4 bes8 | a4 g8 d~ d es4 f8~ | f1~ | f1 
  r4 r8 bes~ bes a4 bes8 | a4 g8 d~ d es4 f8~ | f1~ | f1 \break
  r8 bes8 bes, c d es4 f8~ | f e4 es8~ es4 f~ | f es8 d c bes4 c8~ | c1 | \break
  r4 r8 es~ es d4 es8 | c4 d8 bes~ bes c4 bes8~ | bes1~ | bes1~ | bes1~ | bes1

  \bar ".."
}


grille = \chordmode {
  \set chordChanges = ##f
  \repeat percent 2 bes1:7+
  ges:7+
  b:9.11+
  \break
  bes1:7+
  es:9.11+
  d:m7
  g:7 \break
  c:m7
  \/ a2:m7 d:9+ \startStaff
  g1:m7
  \/ e2:m7 a:7 \startStaff \break
  d1:7+
  \/ e2:m7 a:7
  \/ d:m7 g:7
  \/ c:m7 f:7 \startStaff \bar "||" \break
  \repeat percent 2 bes1:7+
  bes:m7
  bes:m7 \break
  \repeat percent 2 bes1:7+
  f:m7
  bes:7 \break
  es:7+
  as:9.11+ 
  \/ d2:m7 g:m7 \startStaff
  c1:7 \break
  c:m7
  f:7
  \/ bes2:m7 es:7
  \/ bes2:m7 es:7
  \/ bes2:m7 es:7
  \/ bes2:m7 es:7
  \bar ".."
}

marques = \relative c' { 
  s1 ^\markup \bold \box \fontsize #7 A s1*15
  s1 ^\markup \bold \box \fontsize #7 B 
}

verse = \lyricmode {
  Triste é vi -- ver na so -- li -- dão __
  Na dor cru -- el de_u -- ma pai -- xão __
  Triste é sa -- ber que nin -- guém
  Po -- de vi -- ver d_i -- lus -- ão __
  Que nun -- ca vai ser, nun -- ca vai dar
  O son -- ha -- dor tem qu_a -- cor -- dar __
 
  Tu -- a be -- le -- za_é_um a -- vi -- ão __
  De -- mais pra_um po __ bre co -- ra -- ção __
  Que pa -- ra pra te ver pas -- sar
  Só pra me mal -- tra -- tar __
  Triste é vi -- ver na so -- li -- dão __
}

verseB = \lyricmode {
  Sad is to live in so -- li -- tude __
  Far from your tran -- quil al -- ti -- tude __
  Sad is to know that no one e -- ver can live on a dream __
  That ne -- ver can be, will ne -- ver be
  Drea -- mer a -- wake, wake up and see. __

  Your beau -- ty is an aer -- o -- plane __
  So high my heart can't bear the strain __
  A heart that stops when you pass by
  On -- ly to cause me pain __
  Sad is to live in so -- li -- tude __
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
          \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c d' \theNotes
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
  } } \bookpart {
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
          \new Voice \with { \consists "Pitch_squash_engraver" }  \transpose c d' \theNotes
          \addlyrics \verse
          \addlyrics \verseB
      >> >>

  }  } \bookpart {
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
          \new Voice = "PartPOneVoiceOne" { \transpose c a \theNotes }
          \addlyrics \verse
          \addlyrics \verseB
      >> >>
  }   } \bookpart {
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

%{
convert-ly (GNU LilyPond) 2.22.1  convert-ly: Traitement de «  »...
Conversion en cours : 2.20.0, 2.21.0, 2.21.2, 2.22.0
%}
